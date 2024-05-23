package com.example.demo.service

import com.example.demo.dto.EvaluateStudentDto

interface EvaluateStudentService {
    fun evaluateStudent(evaluateStudentDto: EvaluateStudentDto): EvaluateStudentDto
}