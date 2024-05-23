package com.example.demo.service.impl

import com.example.demo.dto.EvaluateCafeDto
import com.example.demo.mapper.EvaluateCafeMapper
import com.example.demo.repository.EvaluateCafeRepository
import com.example.demo.service.EvaluateCafeService
import org.springframework.stereotype.Service

@Service
class EvaluateCafeServiceImpl(
    private val evaluateCafeRepository: EvaluateCafeRepository,
    private val evaluateCafeMapper: EvaluateCafeMapper
) : EvaluateCafeService {
    override fun evaluateCafe(evaluateCafeDto: EvaluateCafeDto): EvaluateCafeDto {
        val evaluateCafeEntity = evaluateCafeMapper.toEntity(evaluateCafeDto)
        val savedEntity = evaluateCafeRepository.save(evaluateCafeEntity)
        return evaluateCafeMapper.toDto(savedEntity)
    }
}