package com.example.demo.dto

data class ReportSummaryDto(
    val reportedPersonId: Long,
    val reportCount: Long,
    val contexts: List<String>
)
