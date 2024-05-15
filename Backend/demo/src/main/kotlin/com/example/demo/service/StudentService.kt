package com.example.demo.service

import com.example.demo.dto.StudentDto


interface StudentService {
    fun createStudent(studentDto: StudentDto): StudentDto
}