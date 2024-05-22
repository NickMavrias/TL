package com.example.demo.repository

import com.example.demo.entity.EvaluateStudent
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface EvaluateStudentRepository : JpaRepository<EvaluateStudent, Long> {
    fun findByEvaluatorId(evaluatorId: Long): List<EvaluateStudent>
}
