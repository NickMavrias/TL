package com.example.demo.service.impl

import org.springframework.stereotype.Service
import com.example.demo.dto.StudentDto
import com.example.demo.mapper.ImageMapper
import com.example.demo.mapper.StudentMapper
import com.example.demo.mapper.UserMapper
import com.example.demo.repository.ImagesRepository
import com.example.demo.repository.StudentsRepository
import com.example.demo.repository.UsersRepository
import com.example.demo.service.StudentService
import org.springframework.transaction.annotation.Transactional

@Service
class StudentServiceImpl(
    private val studentRepository: StudentsRepository,
    private val userRepository: UsersRepository,
    private val imagesRepository: ImagesRepository,
    private val userMapper: UserMapper,
    private val studentMapper: StudentMapper,
    private val imageMapper: ImageMapper
) : StudentService {

    @Transactional
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

        // Save the links associated with the student
        studentDto.images.forEach { imageDto ->
            val imageEntity = imageMapper.toEntity(imageDto)
            imageEntity.student = createdStudent // Set the student property
            imagesRepository.save(imageEntity)
        }

        // Map and return the created student Dto
        return studentMapper.toDto(createdStudent)
    }
}
