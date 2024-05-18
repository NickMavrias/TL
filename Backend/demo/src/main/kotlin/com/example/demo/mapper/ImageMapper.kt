package com.example.demo.mapper

import com.example.demo.dto.ImageDto
import com.example.demo.entity.Image
import org.mapstruct.Mapper
import org.mapstruct.Mapping
import org.mapstruct.Mappings

@Mapper
interface ImageMapper {

    @Mapping(source = "student.id", target = "studentId")
    fun toDTO(image: Image): ImageDto

    @Mapping(source = "studentId", target = "student.id")
    fun toEntity(dto: ImageDto): Image
}