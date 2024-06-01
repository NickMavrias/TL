package com.example.demo.controller

import com.example.demo.dto.ChatMessageDto
import com.example.demo.service.ChatMessageService
import org.slf4j.LoggerFactory
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo
import org.springframework.messaging.handler.annotation.Payload
import org.springframework.messaging.simp.SimpMessageHeaderAccessor
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/chat")
class ChatController(private val chatMessageService: ChatMessageService) {

    private val logger = LoggerFactory.getLogger(ChatController::class.java)

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    fun sendMessage(@Payload chatMessage: ChatMessageDto) {
        logger.info("Received message: ${chatMessage.content} from ${chatMessage.sender}")
        chatMessageService.saveMessage(chatMessage)
    }


    @MessageMapping("/chat.addUser")
    fun addUser(@Payload chatMessage: ChatMessageDto, headerAccessor: SimpMessageHeaderAccessor) {
        val username = "johndoe" // Hardcoded username for user ID 1
        headerAccessor.sessionAttributes?.put("username", username)
        logger.info("User added: $username")
        // No need to save the join message or send it to the topic
    }

    @GetMapping("/messages")
    fun getAllMessages(): List<ChatMessageDto> {
        return chatMessageService.getAllMessages()
    }
}
