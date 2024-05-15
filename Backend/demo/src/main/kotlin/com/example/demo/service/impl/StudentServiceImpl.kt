package com.example.demo.service.impl

import org.springframework.stereotype.Service
import com.example.demo.dto.StudentDto
import com.example.demo.repository.StudentsRepository
import com.example.demo.repository.UsersRepository
import com.example.demo.mapper.UserMapper
import com.example.demo.mapper.StudentMapper
import com.example.demo.service.StudentService

@Service
class StudentServiceImpl(
    private val studentRepository: StudentsRepository,
    private val userRepository: UsersRepository,
    private val userMapper: UserMapper,
    private val studentMapper: StudentMapper,
) : StudentService {

    override fun createStudent(studentDto: StudentDto): StudentDto {
        // Map the user DTO to an entity
        val userEntity = userMapper.toEntity(studentDto.user)

        // Save the user entity
        val savedUser = userRepository.save(userEntity)

        // Map the student DTO to an entity
        val studentEntity = studentMapper.toEntity(studentDto)

        // Set the user property of the student entity
        studentEntity.user = savedUser

        // Save the student entity
        val createdStudent = studentRepository.save(studentEntity)

        // Map and return the created student DTO
        return studentMapper.toDto(createdStudent)
    }
}
