package com.example.demo.mapper

import org.mapstruct.Mapper
import com.example.demo.dto.UserDto
import com.example.demo.entity.User

@Mapper
interface UserMapper {
    fun toEntity(userDto: UserDto): User
    fun toDto(user: User): UserDto
}