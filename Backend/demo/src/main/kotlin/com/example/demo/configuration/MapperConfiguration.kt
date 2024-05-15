package com.example.demo.configuration

import com.example.demo.mapper.StudentMapper
import com.example.demo.mapper.UserMapper
import org.mapstruct.Mapper
import org.mapstruct.factory.Mappers
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
class MapperConfiguration {

    @Bean
    fun userMapper(): UserMapper {
        return Mappers.getMapper(UserMapper::class.java)
    }

    @Bean
    fun studentMapper(): StudentMapper {
        return Mappers.getMapper(StudentMapper::class.java)
    }
}