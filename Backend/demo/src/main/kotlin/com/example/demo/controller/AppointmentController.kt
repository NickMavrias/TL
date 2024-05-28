package com.example.demo.controller

import com.example.demo.dto.EvaluateStudentDto
import com.example.demo.entity.Appointment
import com.example.demo.service.AppointmentService
import com.example.demo.service.EvaluateStudentService
import com.example.demo.service.EvaluateCafeService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController
import java.time.LocalDateTime

@RestController
class AppointmentController @Autowired constructor(
    private val appointmentService: AppointmentService,
    private val evaluateStudentService: EvaluateStudentService,
    private val evaluateCafeService: EvaluateCafeService
) {

    @GetMapping("/api/appointments/past")
    fun getPastAppointments(@RequestParam firstStudentId: Long): List<AppointmentDTO> {
        val appointments = appointmentService.getPastAppointmentsForFirstStudent(firstStudentId)
        return appointments.map { convertToDto(it) }
    }

    private fun convertToDto(appointment: Appointment): AppointmentDTO {
        val evaluation = evaluateStudentService.findEvaluationByEvaluatorAndEvaluated(
            evaluatorId = appointment.firstStudent.id,
            evaluatedPersonId = appointment.secondStudent.id
        )

        return AppointmentDTO(
            secondStudentId = appointment.secondStudent.id,
            secondStudentFullname = appointment.secondStudent.fullname,
            appointmentDate = appointment.appointmentDate,
            isEvaluatedStudent = appointment.isEvaluatedStudent,
            communication = evaluation?.communication,
            trueIrl = evaluation?.trueIrl,
            overall = evaluation?.overall
        )
    }

    data class AppointmentDTO(
        val secondStudentId: Long,
        val secondStudentFullname: String,
        val appointmentDate: LocalDateTime,
        val isEvaluatedStudent: Boolean,
        val communication: Int? = null,
        val trueIrl: Int? = null,
        val overall: Int? = null
    )

    @GetMapping("/api/appointments/pastByCafe")
    fun getPastAppointmentsByCafe(@RequestParam firstStudentId: Long): List<AppointmentByCafeDTO> {
        val appointments = appointmentService.getPastAppointmentsForFirstStudent(firstStudentId)
        return appointments.map { convertToCafeDto(it) }
    }

    private fun convertToCafeDto(appointment: Appointment): AppointmentByCafeDTO {
        val evaluation = evaluateCafeService.findEvaluationByEvaluatorAndEvaluated(
            evaluatorId = appointment.firstStudent.id,
            evaluatedCafeId = appointment.cafe.id
        )

        return AppointmentByCafeDTO(
            cafeId = appointment.cafe.id,
            cafeName = appointment.cafe.cafeName,
            appointmentDate = appointment.appointmentDate,
            isEvaluatedStudent = appointment.isEvaluatedStudent,
            silence = evaluation?.silence,
            vibe = evaluation?.vibe,
            appointmentEval = evaluation?.appointmentEval
        )
    }

    data class AppointmentByCafeDTO(
        val cafeId: Long,
        val cafeName: String,
        val appointmentDate: LocalDateTime,
        val isEvaluatedStudent: Boolean,
        val silence: Int? = null,
        val vibe: Int? = null,
        val appointmentEval: Int? = null
    )
}
