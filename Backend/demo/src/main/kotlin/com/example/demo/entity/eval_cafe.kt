package com.example.demo.entity

import jakarta.persistence.*

@Entity
@Table(name = "eval_cafe")
data class EvaluateCafe(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0,

    @ManyToOne
    @JoinColumn(name = "evaluator_id", nullable = false)
    val evaluator: Student,

    @ManyToOne
    @JoinColumn(name = "evaluated_cafe_id", nullable = false)
    val evaluatedCafe: Cafe,

    @Column(nullable = false)
    val silence: Int,

    @Column(nullable = false)
    val vibe: Int,

    @Column(nullable = false)
    val appointmentEval: Int,

    @Column(nullable = false, columnDefinition = "TEXT")
    val context: String,

    @Column(nullable = false)
    var isEvaluated: Boolean = false
)
