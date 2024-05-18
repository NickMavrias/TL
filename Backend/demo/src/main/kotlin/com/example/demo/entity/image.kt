package com.example.demo.entity

import jakarta.persistence.*

@Entity
@Table(name = "images")
data class Image(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long,
    @Lob
    val imageData: ByteArray,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id") // Define the foreign key column
    var student: Student // Define the many-to-one relationship with the student
)