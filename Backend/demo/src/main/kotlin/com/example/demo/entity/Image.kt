package com.example.demo.entity

import jakarta.persistence.*

@Entity
data class Link(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0,
    val url: String,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id") // Define the foreign key column
    val student: Student // Define the many-to-one relationship with the student

)