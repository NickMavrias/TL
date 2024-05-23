package com.example.demo.mapper

import com.example.demo.dto.EvaluateStudentDto
import com.example.demo.entity.EvaluateStudent
import org.mapstruct.Mapper

@Mapper(componentModel = "spring")
interface EvaluateStudentMapper {
    fun toEntity(evaluateStudentDto: EvaluateStudentDto): EvaluateStudent
    fun toDto(evaluateStudent: EvaluateStudent): EvaluateStudentDto
}
