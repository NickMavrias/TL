package com.example.demo.dto

import com.example.demo.entity.Cafe
import com.example.demo.entity.Student

data class EvaluateCafeDto (
    val evaluator: Student,
    val evaluatedCafe: Cafe,
    val silence: Stars,
    val vibe: Stars,
    val appointmentEval: Stars,
    val context: String
)
