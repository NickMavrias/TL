package com.example.demo.service

import com.example.demo.dto.ReportDto
import com.example.demo.dto.StudentDto
import com.example.demo.dto.StudentNameAndPhotosDto

interface StudentService {
    fun createStudent(studentDto: StudentDto): StudentDto
    fun getOtherStudents(currentUserId: Long): List<StudentNameAndPhotosDto>
    fun getMatchedStudents(currentUserId: Long): List<StudentNameAndPhotosDto>
    fun likeStudent(giverId: Long, receiverId: Long)
    fun dislikeStudent(giverId: Long, receiverId: Long)
    fun superLikeStudent(giverId: Long, receiverId: Long)
    fun getStudentsByIds(studentIds: List<Long>): List<StudentNameAndPhotosDto>
    fun getAllStudentsExcept(studentIds: List<Long>): List<StudentNameAndPhotosDto>
    fun unMatchStudent(loggedInUserId: Long, otherStudentId: Long)
    fun reportStudent(loggedInUserId: Long, reportDto: ReportDto)
}

