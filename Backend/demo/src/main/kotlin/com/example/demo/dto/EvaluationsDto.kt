package com.example.demo.dto

data class EvaluationsDto(
    val studentEvaluations: List<EvaluateStudentDto>,
    val cafeEvaluations: List<EvaluateCafeDto>
)
