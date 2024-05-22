package com.example.demo.entity

import jakarta.persistence.*

@Entity
@Table(name = "report")
data class Report(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0,

    @ManyToOne
    @JoinColumn(name = "reporter_id", referencedColumnName = "id", nullable = false)
    var reporter: User,

    @ManyToOne
    @JoinColumn(name = "reported_person_id", referencedColumnName = "id", nullable = false)
    var reportedPerson: User,

    @Column(name = "context", nullable = true, columnDefinition = "TEXT")
    val context: String
)