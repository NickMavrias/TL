package com.example.demo.dto

import com.example.demo.entity.Gender
import com.example.demo.entity.Interests
import java.time.LocalDate

data class StudentDto(
    val email: String,
    val phone: String,
    val fullname: String,
    val birthday: LocalDate,
    val gender: Gender,
    val wantEmail: Boolean,
    val bio: String,
    val interests: Interests,
    val university: String,
    val department: String,
    val etos: String,
    val emailNotification: Boolean,
    val pushNotification: Boolean,
    val smsNotification: Boolean,
    val user: UserDto
)
