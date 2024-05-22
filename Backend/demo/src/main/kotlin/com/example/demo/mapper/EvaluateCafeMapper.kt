package com.example.demo.mapper

import com.example.demo.dto.EvaluateCafeDto
import com.example.demo.entity.EvaluateCafe
import org.mapstruct.Mapper

@Mapper(componentModel = "spring")
interface EvaluateCafeMapper {
    fun toEntity(evaluateCafeDto: EvaluateCafeDto): EvaluateCafe
    fun toDto(evaluateCafe: EvaluateCafe): EvaluateCafeDto
}