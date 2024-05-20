package com.example.demo.dto

data class StudentNameAndPhotosDto(
    val id: Long,
    val fullname: String,
    val images: List<ImageDto>
)
