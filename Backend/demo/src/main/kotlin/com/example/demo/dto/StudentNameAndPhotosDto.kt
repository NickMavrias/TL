package com.example.demo.dto

data class StudentNameAndPhotosDto(
    val fullname: String,
    val images: List<ImageDto>
)