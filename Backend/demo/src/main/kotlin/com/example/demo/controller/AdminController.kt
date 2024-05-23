package com.example.demo.controller

import com.example.demo.dto.ReportSummaryDto
import com.example.demo.service.AdminService
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/admin")
class AdminController(
    private val adminService: AdminService
) {
    @GetMapping("/report-summaries")
    fun getReportSummaries(): List<ReportSummaryDto> {
        return adminService.getReportSummaries()
    }
}