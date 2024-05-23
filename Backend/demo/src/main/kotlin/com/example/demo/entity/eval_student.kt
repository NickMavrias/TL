package com.example.demo.entity

import com.example.demo.dto.Stars
import jakarta.persistence.*

@Entity
@Table(name = "eval_student")
data class EvaluateStudent(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long,

    @ManyToOne
    @JoinColumn(name = "evaluator_id", nullable = false)
    val evaluator: Student,

    @ManyToOne
    @JoinColumn(name = "evaluated_person_id", nullable = false)
    val evaluatedPerson: Student,

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    val communication: Stars,

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    val trueIrl: Stars,

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    val overall: Stars,

    @Column(nullable = false, columnDefinition = "TEXT")
    val context: String
)
