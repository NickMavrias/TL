package com.example.demo.service

import com.example.demo.dto.EvaluateCafeDto
import com.example.demo.entity.EvaluateCafe

interface EvaluateCafeService {
    fun evaluateCafe(evaluateCafeDto: EvaluateCafeDto): EvaluateCafeDto
    fun findEvaluationByEvaluatorAndEvaluated(evaluatorId: Long, evaluatedCafeId: Long): EvaluateCafe?
}
