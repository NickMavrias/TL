package com.example.demo.mapper

import com.example.demo.dto.StudentNameAndPhotosDto
import com.example.demo.entity.Student
import org.mapstruct.Mapper
import org.mapstruct.Mapping

@Mapper(componentModel = "spring", uses = [ImageMapper::class])
interface StudentNameAndPhotosMapper {

    @Mapping(source = "id", target = "id")
    @Mapping(source = "fullname", target = "fullname")
    @Mapping(source = "images", target = "images")
    fun toDto(student: Student): StudentNameAndPhotosDto
}
