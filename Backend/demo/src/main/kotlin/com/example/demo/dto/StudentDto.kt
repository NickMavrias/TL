package com.example.demo.dto

import com.example.demo.entity.Gender
import com.example.demo.entity.Interests
import java.time.LocalDate

data class StudentDto(
    val email: String,
    val phone: Int,
    val fullname: String,
    val birthday: String,
    val gender: Gender,
    val wantEmail: Boolean,
    val bio: String,
    val interests: Interests,
    val user: UserDto,
    val images: List<ImageDto>  // Add this line to include links
)
