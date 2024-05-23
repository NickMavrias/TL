package com.example.demo.entity

import com.example.demo.dto.Stars
import jakarta.persistence.*

@Entity
@Table(name = "eval_cafe")
data class EvaluateCafe(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long,

    @ManyToOne
    @JoinColumn(name = "evaluator_id", nullable = false)
    val evaluator: Student,

    @ManyToOne
    @JoinColumn(name = "evaluated_cafe_id", nullable = false)
    val evaluatedCafe: Cafe,

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    val silence: Stars,

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    val vibe: Stars,

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    val appointmentEval: Stars,

    @Column(nullable = false, columnDefinition = "TEXT")
    val context: String
)
