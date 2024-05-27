package com.example.demo.entity

import jakarta.persistence.*

@Entity
@Table(name = "cafe")
data class Cafe(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long,

    @Column(name = "name", nullable = false, unique = true)
    var cafeName: String,

    @OneToOne(cascade = [CascadeType.ALL])
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    var user: User
)

