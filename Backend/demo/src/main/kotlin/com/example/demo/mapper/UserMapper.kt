package com.example.demo.mapper

import com.example.demo.dto.UserDto
import com.example.demo.entity.User

class UserMapper {
    fun mapToUserDto(user: User): UserDto {
        return UserDto(
            id = user.id,
            username = user.username,
            password = user.password
        )
    }

    fun mapToUser(userDto: UserDto): User {
        return User(
            id = userDto.id,
            username = userDto.username,
            password = userDto.password
        )
    }
}