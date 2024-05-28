package com.example.demo.entity

import jakarta.persistence.*
import java.time.LocalDateTime

@Entity
@Table(name = "appointment")
data class Appointment(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long = 0,

    @ManyToOne
    @JoinColumn(name = "first_student_id", referencedColumnName = "id", nullable = false)
    var firstStudent: Student,

    @ManyToOne
    @JoinColumn(name = "second_student_id", referencedColumnName = "id", nullable = false)
    var secondStudent: Student,

    @ManyToOne
    @JoinColumn(name = "cafe_id", referencedColumnName = "id", nullable = false)
    var cafe: Cafe,

    @Column(name = "appointment_date", nullable = false)
    var appointmentDate: LocalDateTime,

    @Column(name = "is_evaluated_student", nullable = false)
    var isEvaluatedStudent: Boolean = false,

    @Column(name = "is_evaluated_cafe", nullable = false)
    var isEvaluatedCafe: Boolean = false
)
