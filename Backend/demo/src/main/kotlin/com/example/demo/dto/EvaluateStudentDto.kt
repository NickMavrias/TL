package com.example.demo.dto

data class EvaluateStudentDto(
    val evaluatedPersonId: Long,
    val communication: Int,
    val trueIrl: Int,
    val overall: Int,
    val context: String
)
