package com.example.demo.service

import com.example.demo.dto.UserDto

interface UserService {
    fun createUser(userDto: UserDto): UserDto
}