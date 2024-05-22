package com.example.demo.controller

import com.example.demo.dto.EvaluateCafeDto
import com.example.demo.service.EvaluateCafeService
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/evaluateCafe")
class EvaluateCafeController(
    private val evaluateCafeService: EvaluateCafeService
) {
    @PostMapping
    fun evaluateCafe(@RequestBody evaluateCafeDto: EvaluateCafeDto): EvaluateCafeDto {
        return evaluateCafeService.evaluateCafe(evaluateCafeDto)
    }
}