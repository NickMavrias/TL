package com.example.demo.dto

import com.example.demo.entity.Student

data class EvaluateStudentDto(
    val evaluator: Student,
    val evaluatedPerson: Student,
    val communication: Stars,
    val trueIrl: Stars,
    val overall: Stars,
    val context: String
)