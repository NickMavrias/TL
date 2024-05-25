package com.example.demo.mapper

import com.example.demo.entity.Student
import com.example.demo.dto.StudentNameAndPhotosDto
import org.mapstruct.Mapper
import org.mapstruct.factory.Mappers

@Mapper(componentModel = "spring")
interface StudentNameAndPhotosMapper {

    companion object {
        val INSTANCE: StudentNameAndPhotosMapper = Mappers.getMapper(StudentNameAndPhotosMapper::class.java)
    }

    fun toDto(student: Student): StudentNameAndPhotosDto
    fun toEntity(studentNameAndPhotosDto: StudentNameAndPhotosDto): Student
    fun toDtoList(students: List<Student>): List<StudentNameAndPhotosDto>
}
