package com.example.demo.entity

import com.example.demo.dto.Stars
import jakarta.persistence.*

@Entity
@Table(name = "eval_student")
data class EvaluateStudent(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long? = null, // Make id nullable with a default value

    @ManyToOne
    @JoinColumn(name = "evaluator_id", nullable = false)
    val evaluator: Student,

    @ManyToOne
    @JoinColumn(name = "evaluated_person_id", nullable = false)
    val evaluatedPerson: Student,

    @Column(nullable = false)
    val communication: Int,

    @Column(nullable = false)
    val trueIrl: Int,

    @Column(nullable = false)
    val overall: Int,

    @Column(nullable = false, columnDefinition = "TEXT")
    val context: String,

    @Column(nullable = false)
    var isEvaluated: Boolean = false
)
