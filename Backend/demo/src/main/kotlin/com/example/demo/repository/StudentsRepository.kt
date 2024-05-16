package com.example.demo.repository

import com.example.demo.entity.Student
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface StudentsRepository : JpaRepository<Student, Long> {
    fun findByEmail(email: String): Student?
}
