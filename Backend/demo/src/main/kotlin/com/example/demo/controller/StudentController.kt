package com.example.demo.controller

import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import com.example.demo.dto.StudentDto
import com.example.demo.dto.StudentNameAndPhotosDto
import com.example.demo.entity.User
import com.example.demo.repository.FeedRepository
import com.example.demo.service.StudentService
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpSession

@RestController
@RequestMapping("/api/students")
class StudentController(private val studentService: StudentService,
                        private val httpSession: HttpSession,
                        private val feedRepository: FeedRepository
) {

    @PostMapping
    fun createStudent(@RequestBody studentDto: StudentDto): ResponseEntity<StudentDto> {
        val createdStudentDto = studentService.createStudent(studentDto)
        return ResponseEntity(createdStudentDto, HttpStatus.CREATED)
    }

    @GetMapping("/other")
    fun getOtherStudents(): ResponseEntity<List<StudentNameAndPhotosDto>> {
        val currentUser = httpSession.getAttribute("user") as? User ?:
        return ResponseEntity(HttpStatus.UNAUTHORIZED)

        // Get the IDs of students with positive interactions (feed with weight = true) with the logged-in user
        val interactedStudentIds = feedRepository.findPositiveInteractedStudentIds(currentUser.id)

        // Get students with positive interactions
        val interactedStudents = studentService.getStudentsByIds(interactedStudentIds)

        // Get all students except those with positive interactions
        val otherStudents = studentService.getAllStudentsExcept(interactedStudentIds)

        // Combine and return the lists
        val allStudents = interactedStudents + otherStudents
        return ResponseEntity(allStudents, HttpStatus.OK)
    }


    @PostMapping("/{id}/like")
    fun likeStudent(@PathVariable id: Long, httpServletRequest: HttpServletRequest): ResponseEntity<Void> {
        val loggedInUserId = (httpServletRequest.session.getAttribute("user") as User).id
        studentService.likeStudent(loggedInUserId, id)
        return ResponseEntity.ok().build()
    }

    @PostMapping("/{id}/dislike")
    fun dislikeStudent(@PathVariable id: Long, httpServletRequest: HttpServletRequest): ResponseEntity<Void> {
        val loggedInUserId = (httpServletRequest.session.getAttribute("user") as User).id
        studentService.likeStudent(loggedInUserId, id)
        return ResponseEntity.ok().build()
    }

    @PostMapping("/{id}/superLike")
    fun superLikeStudent(@PathVariable id: Long, httpServletRequest: HttpServletRequest): ResponseEntity<Void> {
        val loggedInUserId = (httpServletRequest.session.getAttribute("user") as User).id
        studentService.likeStudent(loggedInUserId, id)
        return ResponseEntity.ok().build()
    }
}