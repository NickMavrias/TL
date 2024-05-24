package com.example.demo.mapper

import com.example.demo.dto.StudentDto
import com.example.demo.entity.Student
import org.mapstruct.Mapper
import org.mapstruct.factory.Mappers

@Mapper
interface StudentMapper {
    companion object {
        val INSTANCE: StudentMapper = Mappers.getMapper(StudentMapper::class.java)
    }

    fun toEntity(studentDto: StudentDto): Student

    fun toDto(student: Student): StudentDto
}
