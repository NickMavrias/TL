package com.example.demo.service.impl

import com.example.demo.dto.UserDto
import com.example.demo.entity.User
import com.example.demo.mapper.UserMapper
import com.example.demo.repository.StudentsRepository
import com.example.demo.repository.UsersRepository
import com.example.demo.service.UserService
import net.javaguides.ems.exception.ResourceNotFoundException
import org.springframework.stereotype.Service
import jakarta.servlet.http.HttpSession

@Service
class UserServiceImpl(
    private val userRepository: UsersRepository,
    private val studentRepository: StudentsRepository,
    private val userMapper: UserMapper,
    private val httpSession: HttpSession
) : UserService {

    override fun createUser(userDto: UserDto): UserDto {
        val user = userMapper.toEntity(userDto)
        val savedUser = userRepository.save(user)
        return userMapper.toDto(savedUser)
    }

    override fun getUserById(userId: Long): UserDto {
        val user = userRepository.findById(userId)
            .orElseThrow { ResourceNotFoundException("User does not exist: $userId") }

        return userMapper.toDto(user)
    }

    override fun getAllUsers(): List<UserDto> {
        val users: List<User> = userRepository.findAll()
        return users.map { user -> userMapper.toDto(user) }
    }

    override fun updateUser(userId: Long, updatedUser: UserDto): UserDto {
        val user = userRepository.findById(userId)
            .orElseThrow { ResourceNotFoundException("User does not exist: $userId") }

        user.username = updatedUser.username
        user.password = updatedUser.password

        val updatedUserObj = userRepository.save(user)
        return userMapper.toDto(updatedUserObj)
    }

    override fun deleteUser(userId: Long) {
        val user = userRepository.findById(userId)
            .orElseThrow { ResourceNotFoundException("User does not exist: $userId") }

        userRepository.deleteById(userId)
    }

    override fun loginUser(identifier: String, password: String): Boolean {
        val user = userRepository.findByUsernameAndPassword(identifier, password)
            ?: userRepository.findByUsername(identifier)?.let { user ->
                if (user.password == password) user else null
            }
            ?: studentRepository.findByEmail(identifier)?.user?.takeIf { it.password == password }

        return if (user != null) {
            httpSession.setAttribute("user", user)
            true
        } else {
            false
        }
    }

    override fun checkUsernameOrEmailUnique(username: String, email: String): String {
        val usernameExists = userRepository.findByUsername(username) != null
        val emailExists = studentRepository.findByEmail(email) != null

        return when {
            usernameExists -> "Username already exists"
            emailExists -> "Email already exists"
            else -> "Both username and email are unique"
        }
    }
}
