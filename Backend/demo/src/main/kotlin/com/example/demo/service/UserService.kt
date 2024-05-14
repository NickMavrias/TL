package com.example.demo.service

import com.example.demo.dto.UserDto

interface UserService {
    fun createUser(userDto: UserDto): UserDto

    fun getUserById(userId: Long): UserDto

    fun getAllUsers(): List<UserDto>

    fun updateUser(userId: Long, updatedUser: UserDto): UserDto

    fun deleteUser(userId: Long)

    fun loginUser(username: String, password: String): Int


}