package com.example.demo.service

import com.example.demo.dto.EvaluateCafeDto
import com.example.demo.entity.EvaluateCafe
import com.example.demo.repository.CafeRepository
import com.example.demo.repository.EvaluateCafeRepository
import com.example.demo.repository.StudentsRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class EvaluateCafeServiceImpl(
    private val evaluateCafeRepository: EvaluateCafeRepository,
    private val studentRepository: StudentsRepository,
    private val cafeRepository: CafeRepository
) : EvaluateCafeService {

    override fun evaluateCafe(evaluateCafeDto: EvaluateCafeDto): EvaluateCafeDto {
        val evaluator = studentRepository.findById(1).orElseThrow {
            RuntimeException("Evaluator student with ID 1 not found")
        }

        val evaluatedCafe = cafeRepository.findById(evaluateCafeDto.evaluatedCafeId).orElseThrow {
            RuntimeException("Evaluated cafe with ID ${evaluateCafeDto.evaluatedCafeId} not found")
        }

        val evaluateCafe = EvaluateCafe(
            evaluator = evaluator,
            evaluatedCafe = evaluatedCafe,
            silence = evaluateCafeDto.silence,
            vibe = evaluateCafeDto.vibe,
            appointmentEval = evaluateCafeDto.appointmentEval,
            context = evaluateCafeDto.context,
            isEvaluated = true
        )

        val savedEntity = evaluateCafeRepository.save(evaluateCafe)
        return evaluateCafeDto
    }

    override fun findEvaluationByEvaluatorAndEvaluated(evaluatorId: Long, evaluatedCafeId: Long): EvaluateCafe? {
        return evaluateCafeRepository.findByEvaluatorIdAndEvaluatedCafeId(evaluatorId, evaluatedCafeId)
    }
}
