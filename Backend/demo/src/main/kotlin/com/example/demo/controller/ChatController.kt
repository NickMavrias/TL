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
    @SendTo("/topic/public")
    fun addUser(@Payload chatMessage: ChatMessageDto, headerAccessor: SimpMessageHeaderAccessor): ChatMessageDto {
        headerAccessor.sessionAttributes?.put("username", chatMessage.sender)
        chatMessageService.saveMessage(chatMessage)
        return chatMessage
    }

    @MessageMapping("/chat.navigate")
    @SendTo("/topic/session")
    fun navigate(@Payload chatMessage: ChatMessageDto): ChatMessageDto {
        return chatMessage
    }
}
