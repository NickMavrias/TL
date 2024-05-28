package com.example.demo.service

import com.example.demo.dto.EvaluateStudentDto
import com.example.demo.entity.EvaluateStudent

interface EvaluateStudentService {
    fun evaluateStudent(evaluateStudentDto: EvaluateStudentDto): EvaluateStudentDto
    fun findEvaluationByEvaluatorAndEvaluated(evaluatorId: Long, evaluatedPersonId: Long): EvaluateStudent?
}
