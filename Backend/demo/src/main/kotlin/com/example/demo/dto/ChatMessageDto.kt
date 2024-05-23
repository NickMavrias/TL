package com.example.demo.dto

data class ChatMessageDto(
    val sender: String,
    val content: String,
    val type: MessageType
)
