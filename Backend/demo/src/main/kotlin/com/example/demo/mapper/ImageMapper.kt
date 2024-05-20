package com.example.demo.mapper

import com.example.demo.dto.ImageDto
import com.example.demo.entity.Image
import com.example.demo.entity.Student
import org.mapstruct.Mapper
import org.mapstruct.Mapping
import org.mapstruct.Mappings
import org.mapstruct.AfterMapping
import org.mapstruct.MappingTarget

@Mapper(componentModel = "spring")
interface ImageMapper {

    @Mappings(
        Mapping(source = "imageData", target = "imageData")
    )
    fun toDto(image: Image): ImageDto

    @Mappings(
        Mapping(target = "id", ignore = true), // Assuming ID is auto-generated
        Mapping(target = "student", ignore = true) // We will set the student manually
    )
    fun toEntity(dto: ImageDto): Image

    @AfterMapping
    fun setStudent(@MappingTarget image: Image, student: Student) {
        image.student = student
    }
}
