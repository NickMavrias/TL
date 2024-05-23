package com.example.demo.entity

import com.example.demo.dto.MessageType
import jakarta.persistence.*

@Entity
@Table(name = "chat_messages")
data class ChatMessage(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0,

    @Column(nullable = false)
    val sender: String,

    @Column(nullable = false)
    val content: String,

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    val type: MessageType
)
