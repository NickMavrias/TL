package com.example.demo.mapper

import com.example.demo.dto.StudentDto
import com.example.demo.entity.Student
import org.mapstruct.Mapper
import org.mapstruct.Mapping

@Mapper
interface StudentMapper {
    @Mapping(source = "birthday", target = "birthday")
    fun toEntity(studentDto: StudentDto): Student

    @Mapping(source = "birthday", target = "birthday")
    fun toDto(student: Student): StudentDto
}