package com.example.demo.repository

import com.example.demo.entity.EvaluateCafe
import org.springframework.data.jpa.repository.JpaRepository

interface EvaluateCafeRepository : JpaRepository<EvaluateCafe, Long> {
    fun findByEvaluatorIdAndEvaluatedCafeId(evaluatorId: Long, evaluatedCafeId: Long): EvaluateCafe?
}
