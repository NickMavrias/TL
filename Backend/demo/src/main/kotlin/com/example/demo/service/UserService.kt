package com.example.demo.service

import com.example.demo.dto.UserDto

interface UserService {
    fun createUser(userDto: UserDto): UserDto
    fun getUserById(userId: Long): UserDto
    fun getAllUsers(): List<UserDto>
    fun updateUser(userId: Long, updatedUser: UserDto): UserDto
    fun deleteUser(userId: Long)
    fun loginUser(identifier: String, password: String): Boolean
    fun checkUsernameOrEmailUnique(username: String, email: String): String
}
