package com.example.demo.controller

import com.example.demo.dto.ChatMessageDto
import com.example.demo.dto.SessionActionDto
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo
import org.springframework.messaging.handler.annotation.Payload
import org.springframework.stereotype.Controller

@Controller
class SessionController {

    @MessageMapping("/session.action")
    @SendTo("/topic/session")
    fun handleSessionAction(@Payload sessionAction: SessionActionDto): SessionActionDto {
        return sessionAction
    }
}
