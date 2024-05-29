package com.example.demo.controller

import com.example.demo.dto.*
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import com.example.demo.repository.FeedRepository
import com.example.demo.repository.MatchRepository
import com.example.demo.service.StudentService

@RestController
@RequestMapping("/api/students")
class StudentController(
    private val studentService: StudentService,
    private val feedRepository: FeedRepository,
    private val matchRepository: MatchRepository
) {

    @PostMapping
    fun createStudent(@RequestBody studentDto: StudentDto): ResponseEntity<StudentDto> {
        val createdStudentDto = studentService.createStudent(studentDto)
        return ResponseEntity(createdStudentDto, HttpStatus.CREATED)
    }

    @GetMapping("/other")
    fun getOtherStudents(): ResponseEntity<List<StudentNameAndPhotosDto>> {
        val hardcodedUserId = 1L // Hardcoded student ID
        val otherStudents = studentService.getOtherStudents(hardcodedUserId)
        return ResponseEntity(otherStudents, HttpStatus.OK)
    }


    @GetMapping("/matched")
    fun getMatchedStudents(): ResponseEntity<List<StudentNameAndPhotosDto>> {
        val matchedStudents = studentService.getMatchedStudents(currentUserId = 1L)

        // Directly map to DTO
        val matchedStudentsWithAge = matchedStudents.map { student ->
            StudentNameAndPhotosDto(
                id = student.id,
                fullname = student.fullname,
                age = student.age // Ensure that age calculation logic is integrated in the service layer
            )
        }

        return ResponseEntity(matchedStudentsWithAge, HttpStatus.OK)
    }

    @PostMapping("/{id}/like")
    fun likeStudent(@PathVariable id: Long): ResponseEntity<Void> {
        val loggedInUserId = 1L // Hardcoded student ID
        studentService.likeStudent(loggedInUserId, id)
        return ResponseEntity.ok().build()
    }

    @PostMapping("/{id}/dislike")
    fun dislikeStudent(@PathVariable id: Long): ResponseEntity<Void> {
        val loggedInUserId = 1L // Hardcoded student ID
        studentService.dislikeStudent(loggedInUserId, id)
        return ResponseEntity.ok().build()
    }

    @PostMapping("/{id}/superLike")
    fun superLikeStudent(@PathVariable id: Long): ResponseEntity<Void> {
        val loggedInUserId = 1L // Hardcoded student ID
        studentService.superLikeStudent(loggedInUserId, id)
        return ResponseEntity.ok().build()
    }

    @PostMapping("/{id}/unmatch")
    fun unMatchStudent(@PathVariable id: Long): ResponseEntity<Void> {
        val loggedInUserId = 1L // Hardcoded student ID
        studentService.unMatchStudent(loggedInUserId, id)
        return ResponseEntity.ok().build()
    }

    @PostMapping("/report")
    fun reportStudent(@RequestBody reportDto: ReportDto): ResponseEntity<Void> {
        val loggedInUserId = 1L // Hardcoded student ID
        studentService.reportStudent(loggedInUserId, reportDto)
        return ResponseEntity.ok().build()
    }

    @PostMapping("/block")
    fun blockStudent(@RequestBody blockDto: BlockDto): ResponseEntity<Void> {
        val loggedInUserId = 1L // Hardcoded student ID
        studentService.blockStudent(loggedInUserId, blockDto)
        return ResponseEntity.ok().build()
    }
}
