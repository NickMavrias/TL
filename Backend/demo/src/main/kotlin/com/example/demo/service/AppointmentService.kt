package com.example.demo.service

import com.example.demo.entity.Appointment
import com.example.demo.repository.AppointmentRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import java.time.LocalDateTime

@Service
class AppointmentService @Autowired constructor(
    private val appointmentRepository: AppointmentRepository
) {

    fun getPastAppointmentsForFirstStudent(firstStudentId: Long): List<Appointment> {
        return appointmentRepository.findAppointmentsBeforeNowWithFirstStudentId(firstStudentId, LocalDateTime.now())
    }
}
