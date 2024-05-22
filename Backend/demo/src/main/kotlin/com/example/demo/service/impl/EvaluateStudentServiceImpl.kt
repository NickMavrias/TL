package com.example.demo.service

import com.example.demo.dto.EvaluateStudentDto
import com.example.demo.mapper.EvaluateStudentMapper
import com.example.demo.repository.EvaluateStudentRepository
import org.springframework.stereotype.Service

@Service
class EvaluateStudentServiceImpl(
    private val evaluateStudentRepository: EvaluateStudentRepository,
    private val evaluateStudentMapper: EvaluateStudentMapper
) : EvaluateStudentService {
    override fun evaluateStudent(evaluateStudentDto: EvaluateStudentDto): EvaluateStudentDto {
        val evaluateStudentEntity = evaluateStudentMapper.toEntity(evaluateStudentDto)
        val savedEntity = evaluateStudentRepository.save(evaluateStudentEntity)
        return evaluateStudentMapper.toDto(savedEntity)
    }
}
