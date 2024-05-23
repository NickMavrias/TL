package com.example.demo.service

import com.example.demo.dto.ReportSummaryDto

interface AdminService {
    fun getReportSummaries(): List<ReportSummaryDto>
}
