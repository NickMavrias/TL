package com.example.demo.service

import com.example.demo.dto.ChatMessageDto

interface ChatMessageService {
    fun saveMessage(chatMessage: ChatMessageDto)
    fun getAllMessages(): List<ChatMessageDto>
}
