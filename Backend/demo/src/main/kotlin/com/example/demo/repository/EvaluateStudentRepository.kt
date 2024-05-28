package com.example.demo.repository

import com.example.demo.entity.EvaluateStudent
import org.springframework.data.jpa.repository.JpaRepository

interface EvaluateStudentRepository : JpaRepository<EvaluateStudent, Long> {
    fun findByEvaluatorIdAndEvaluatedPersonId(evaluatorId: Long, evaluatedPersonId: Long): EvaluateStudent?
}
