package com.example.demo.service.impl

import org.springframework.stereotype.Service
import com.example.demo.dto.StudentDto
import com.example.demo.dto.StudentNameAndPhotosDto
import com.example.demo.mapper.ImageMapper
import com.example.demo.mapper.StudentMapper
import com.example.demo.mapper.StudentNameAndPhotosMapper
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
    private val imageMapper: ImageMapper,
    private val studentNameAndPhotosMapper: StudentNameAndPhotosMapper
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

        // Map the images DTOs to entities and associate them with the created student
        val imagesEntities = studentDto.images.map { imageDto ->
            val imageEntity = imageMapper.toEntity(imageDto)
            imageEntity.student = createdStudent
            imageEntity
        }

        // Save the images associated with the student
        imagesRepository.saveAll(imagesEntities)

        // Map and return the created student DTO
        return studentMapper.toDto(createdStudent)
    }

    @Transactional(readOnly = true)
    override fun getOtherStudents(currentUserId: Long): List<StudentNameAndPhotosDto> {
        return studentRepository.findAll()
            .filter { it.user.id != currentUserId }
            .map { student ->
                studentNameAndPhotosMapper.toDto(student) // Use the new mapper
            }
    }
}
