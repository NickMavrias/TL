package com.example.demo.service.impl

import com.example.demo.dto.ReportSummaryDto
import com.example.demo.repository.ReportRepository
import com.example.demo.service.AdminService
import org.springframework.stereotype.Service

@Service
class AdminServiceImpl(
    private val reportRepository: ReportRepository
) : AdminService {
    override fun getReportSummaries(): List<ReportSummaryDto> {
        val reports = reportRepository.findAll()

        return reports.groupBy { it.reportedPerson.id }
            .map { (reportedPersonId, reports) ->
                ReportSummaryDto(
                    reportedPersonId = reportedPersonId,
                    reportCount = reports.size.toLong(),
                    contexts = reports.map { it.context }.distinct()
                )
            }
    }
}