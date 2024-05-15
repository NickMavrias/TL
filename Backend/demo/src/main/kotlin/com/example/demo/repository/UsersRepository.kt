package com.example.demo.repository

import com.example.demo.entity.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface UsersRepository : JpaRepository<User, Long> {
    fun findByUsernameAndPassword(username: String, password: String): User?
    fun findByUsername(username: String): User?
}
