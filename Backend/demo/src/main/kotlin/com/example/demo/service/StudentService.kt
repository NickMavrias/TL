package com.example.demo.service

import com.example.demo.dto.StudentDto
import com.example.demo.dto.StudentNameAndPhotosDto

interface StudentService {
    fun createStudent(studentDto: StudentDto): StudentDto
    fun getOtherStudents(currentUserId: Long): List<StudentNameAndPhotosDto> // New method
}
