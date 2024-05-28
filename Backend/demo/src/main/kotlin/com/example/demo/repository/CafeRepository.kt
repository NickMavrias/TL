package com.example.demo.repository

import com.example.demo.entity.Cafe
import org.springframework.data.jpa.repository.JpaRepository

interface CafeRepository : JpaRepository<Cafe, Long> {
}