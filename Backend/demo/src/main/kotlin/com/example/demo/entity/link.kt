package com.example.demo.entity

import jakarta.persistence.*

@Entity
@Table(name = "links")
data class Link(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0,
    val url: String,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id") // Define the foreign key column
    var student: Student // Define the many-to-one relationship with the student
)