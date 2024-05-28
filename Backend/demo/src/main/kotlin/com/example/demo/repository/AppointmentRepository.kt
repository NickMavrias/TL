package com.example.demo.repository

import com.example.demo.entity.Appointment
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import java.time.LocalDateTime

interface AppointmentRepository : JpaRepository<Appointment, Long> {
    @Query("SELECT a FROM Appointment a WHERE a.firstStudent.id = :firstStudentId AND a.appointmentDate < :now")
    fun findAppointmentsBeforeNowWithFirstStudentId(@Param("firstStudentId") firstStudentId: Long, @Param("now") now: LocalDateTime): List<Appointment>

    fun findByFirstStudentIdAndSecondStudentId(firstStudentId: Long, secondStudentId: Long): Appointment?
}
