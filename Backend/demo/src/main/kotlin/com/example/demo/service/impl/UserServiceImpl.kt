package com.example.demo.service.impl

import com.example.demo.dto.UserDto
import com.example.demo.mapper.UserMapper
import com.example.demo.repository.UsersRepository
import com.example.demo.service.UserService
import org.springframework.stereotype.Service

@Service
class UserServiceImpl constructor(private val userRepository: UsersRepository) : UserService {

    private val userMapper = UserMapper() // Create an instance of UserMapper

    override fun createUser(userDto: UserDto): UserDto {
        val user = userMapper.mapToUser(userDto) // Call instance method on userMapper
        val savedUser = userRepository.save(user)
        return userMapper.mapToUserDto(savedUser) // Call instance method on userMapper
    }
}
