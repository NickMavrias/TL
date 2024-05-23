package com.example.demo.service.impl

import com.example.demo.dto.ChatMessageDto
import com.example.demo.entity.ChatMessage
import com.example.demo.repository.ChatMessageRepository
import com.example.demo.service.ChatMessageService
import org.springframework.stereotype.Service

@Service
class ChatMessageServiceImpl(private val chatMessageRepository: ChatMessageRepository) : ChatMessageService {

    override fun saveMessage(chatMessage: ChatMessageDto) {
        val entity = ChatMessage(
            sender = chatMessage.sender,
            content = chatMessage.content,
            type = chatMessage.type
        )
        chatMessageRepository.save(entity)
    }

    override fun getAllMessages(): List<ChatMessageDto> {
        return chatMessageRepository.findAll().map { entity ->
            ChatMessageDto(
                sender = entity.sender,
                content = entity.content,
                type = entity.type
            )
        }
    }
}
