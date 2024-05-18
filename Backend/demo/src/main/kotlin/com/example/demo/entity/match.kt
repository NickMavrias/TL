package com.example.demo.entity

import jakarta.persistence.*

@Entity
@Table(name = "matches") // Renamed to plural form for convention
data class Match(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long, // Added primary key

    @ManyToOne
    @JoinColumn(name = "giver_id", nullable = false)
    var giver: Student,

    @ManyToOne
    @JoinColumn(name = "receiver_id", nullable = false)
    var receiver: Student,

    @Column(name = "is_match", nullable = false)
    var isMatch: Boolean
)
