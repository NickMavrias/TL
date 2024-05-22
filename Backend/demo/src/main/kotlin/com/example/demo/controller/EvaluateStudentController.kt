package com.example.demo.controller

import com.example.demo.dto.EvaluateStudentDto
import com.example.demo.service.EvaluateStudentService
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/evaluateStudents")
class EvaluateStudentController(
    private val evaluateStudentService: EvaluateStudentService // Inject the service
) {

    @PostMapping
    fun evaluateStudent(@RequestBody evaluateStudentDto: EvaluateStudentDto): EvaluateStudentDto {
        // Call the service method to evaluate the student
        return evaluateStudentService.evaluateStudent(evaluateStudentDto)
    }
}
