package com.example.demo.service

import com.example.demo.dto.EvaluateCafeDto

interface EvaluateCafeService {
    fun evaluateCafe(evaluateCafeDto: EvaluateCafeDto): EvaluateCafeDto
}