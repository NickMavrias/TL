package com.example.demo.controller

import com.example.demo.dto.EvaluationsDto
import com.example.demo.dto.ReportDto
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
        val currentUser = httpSession.getAttribute("user") as? User ?: return ResponseEntity(HttpStatus.UNAUTHORIZED)

        // Fetch IDs of students with positive interactions, excluding the logged-in user's ID
        val interactedStudentIds = feedRepository.findPositiveInteractedStudentIds(currentUser.id).toMutableList()

        // Explicitly add current user's ID to ensure exclusion
        interactedStudentIds.add(currentUser.id)

        // Get students with positive interactions (not including the current user)
        val interactedStudents = studentService.getStudentsByIds(interactedStudentIds)

        // Exclude these IDs from the full list to get 'other' students
        val otherStudents = studentService.getAllStudentsExcept(interactedStudentIds)

        // Combine and filter out the current user just to be doubly sure
        val allStudents = (interactedStudents + otherStudents).filterNot { it.id == currentUser.id }

        return ResponseEntity(allStudents, HttpStatus.OK)
    }



    @GetMapping("/matched")
    fun getMatchedStudents(): ResponseEntity<List<StudentNameAndPhotosDto>> {
        val currentUser = httpSession.getAttribute("user") as? User ?:
        return ResponseEntity(HttpStatus.UNAUTHORIZED)

        val matchedStudents = studentService.getMatchedStudents(currentUser.id)
        return ResponseEntity(matchedStudents, HttpStatus.OK)
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

    @PostMapping("/{id}/unmatch")
    fun unMatchStudent(@PathVariable id: Long, httpServletRequest: HttpServletRequest): ResponseEntity<Void> {
        val loggedInUserId = (httpServletRequest.session.getAttribute("user") as User).id
        studentService.unMatchStudent(loggedInUserId, id)
        return ResponseEntity.ok().build()
    }

    @PostMapping("/report")
    fun reportStudent(@RequestBody reportDto: ReportDto, httpServletRequest: HttpServletRequest): ResponseEntity<Void> {
        val loggedInUser = httpServletRequest.session.getAttribute("user") as? User ?: return ResponseEntity(HttpStatus.UNAUTHORIZED)
        studentService.reportStudent(loggedInUser.id, reportDto)
        return ResponseEntity.ok().build()
    }

    @GetMapping("/evaluator/{id}")
    fun getEvaluationsByEvaluatorId(@PathVariable id: Long): ResponseEntity<EvaluationsDto> {
        val evaluations = studentService.getEvaluationsByEvaluatorId(id)
        return ResponseEntity.ok(evaluations)
    }

}
