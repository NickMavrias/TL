package com.example.demo.controller

import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import com.example.demo.dto.StudentDto
import com.example.demo.dto.StudentNameAndPhotosDto
import com.example.demo.entity.User
import com.example.demo.service.StudentService
import jakarta.servlet.http.HttpSession

@RestController
@RequestMapping("/api/students")
class StudentController(private val studentService: StudentService,
                        private val httpSession: HttpSession
) {

    @PostMapping
    fun createStudent(@RequestBody studentDto: StudentDto): ResponseEntity<StudentDto> {
        val createdStudentDto = studentService.createStudent(studentDto)
        return ResponseEntity(createdStudentDto, HttpStatus.CREATED)
    }

    @GetMapping("/other")
    fun getOtherStudents(): ResponseEntity<List<StudentNameAndPhotosDto>> {
        val currentUser = httpSession.getAttribute("user") as? User
        if (currentUser == null) {
            return ResponseEntity(HttpStatus.UNAUTHORIZED)
        }
        val otherStudents = studentService.getOtherStudents(currentUser.id)
        return ResponseEntity(otherStudents, HttpStatus.OK)
    }
}