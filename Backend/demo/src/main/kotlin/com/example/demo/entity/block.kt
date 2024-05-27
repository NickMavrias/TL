package com.example.demo.entity

import jakarta.persistence.*

@Entity
@Table(name = "block")
data class Block(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0,

    @ManyToOne
    @JoinColumn(name = "block_id", referencedColumnName = "id", nullable = false)
    var blocker: User,

    @ManyToOne
    @JoinColumn(name = "blocked_person_id", referencedColumnName = "id", nullable = false)
    var blockedPerson: User
)