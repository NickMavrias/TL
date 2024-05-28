package com.example.demo.service

import com.example.demo.dto.EvaluateStudentDto
import com.example.demo.entity.EvaluateStudent
import com.example.demo.repository.EvaluateStudentRepository
import com.example.demo.repository.StudentsRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class EvaluateStudentServiceImpl(
    private val evaluateStudentRepository: EvaluateStudentRepository,
    private val studentRepository: StudentsRepository
) : EvaluateStudentService {

    override fun evaluateStudent(evaluateStudentDto: EvaluateStudentDto): EvaluateStudentDto {
        val evaluator = studentRepository.findById(1).orElseThrow {
            RuntimeException("Evaluator student with ID 1 not found")
        }

        val evaluatedPerson = studentRepository.findById(evaluateStudentDto.evaluatedPersonId).orElseThrow {
            RuntimeException("Evaluated student with ID ${evaluateStudentDto.evaluatedPersonId} not found")
        }

        val evaluateStudent = EvaluateStudent(
            evaluator = evaluator,
            evaluatedPerson = evaluatedPerson,
            communication = evaluateStudentDto.communication,
            trueIrl = evaluateStudentDto.trueIrl,
            overall = evaluateStudentDto.overall,
            context = evaluateStudentDto.context,
            isEvaluated = true
        )

        val savedEntity = evaluateStudentRepository.save(evaluateStudent)
        return evaluateStudentDto
    }

    override fun findEvaluationByEvaluatorAndEvaluated(evaluatorId: Long, evaluatedPersonId: Long): EvaluateStudent? {
        return evaluateStudentRepository.findByEvaluatorIdAndEvaluatedPersonId(evaluatorId, evaluatedPersonId)
    }
}
