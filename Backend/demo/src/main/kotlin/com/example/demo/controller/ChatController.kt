package com.example.demo.controller

import com.example.demo.dto.ChatMessageDto
import com.example.demo.service.ChatMessageService
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo
import org.springframework.messaging.handler.annotation.Payload
import org.springframework.messaging.simp.SimpMessageHeaderAccessor
import org.springframework.stereotype.Controller

@Controller
class ChatController(private val chatMessageService: ChatMessageService) {

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    fun sendMessage(@Payload chatMessage: ChatMessageDto): ChatMessageDto {
        chatMessageService.saveMessage(chatMessage)
        return chatMessage
    }

    @MessageMapping("/chat.addUser")
    fun addUser(@Payload chatMessage: ChatMessageDto, headerAccessor: SimpMessageHeaderAccessor) {
        val username = "johndoe" // Hardcoded username for user ID 1
        headerAccessor.sessionAttributes?.put("username", username)
        // No need to save the join message or send it to the topic
    }

    @MessageMapping("/chat.navigate")
    @SendTo("/topic/session")
    fun navigate(@Payload chatMessage: ChatMessageDto): ChatMessageDto {
        return chatMessage
    }
}