package com.example.demo.service.impl

import com.example.demo.dto.UserDto
import com.example.demo.entity.User
import com.example.demo.mapper.UserMapper
import com.example.demo.repository.UsersRepository
import com.example.demo.service.UserService
import net.javaguides.ems.exception.ResourceNotFoundException
import org.springframework.stereotype.Service

@Service
class UserServiceImpl constructor(private val userRepository: UsersRepository,
                                  private val userMapper: UserMapper) : UserService {


    override fun createUser(userDto: UserDto): UserDto {
        val user = userMapper.toEntity(userDto) // Call instance method on userMapper
        val savedUser = userRepository.save(user)
        return userMapper.toDto(savedUser) // Call instance method on userMapper
    }

    override fun getUserById(userId: Long): UserDto {
        val user = userRepository.findById(userId)
            .orElseThrow { ResourceNotFoundException("User does not exist: $userId") }

        return userMapper.toDto(user) // Call instance method on userMapper
    }

    override fun getAllUsers(): List<UserDto> {
        val users: List<User> = userRepository.findAll()
        return users.map { user -> userMapper.toDto(user) }
    }

    override fun updateUser(userId: Long, updatedUser: UserDto): UserDto {
        val user = userRepository.findById(userId)
            .orElseThrow { ResourceNotFoundException("User does not exist: $userId") }

        // Update user details
        user.username = updatedUser.username
        user.password = updatedUser.password

        // Save updated user
        val updatedUserObj = userRepository.save(user)

        return userMapper.toDto(updatedUserObj)
    }

    override fun deleteUser(userId: Long) {
        val user = userRepository.findById(userId)
            .orElseThrow { ResourceNotFoundException("User does not exist: $userId") }

        userRepository.deleteById(userId)
    }

    override fun loginUser(username: String, password: String): String {
        val user: User? = userRepository.findByUsernameAndPassword(username, password)
        return if (user != null) {
            "success"
        } else {
            "no"
        } // travaei apo thn vash pinaka eggrafhs
    }


}

