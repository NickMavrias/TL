package com.example.demo.repository

import com.example.demo.entity.Match
import com.example.demo.entity.Student
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository

@Repository
interface MatchRepository : JpaRepository<Match, Long> {
    fun findByGiverIdAndReceiverId(giverId: Long, receiverId: Long): Match?
    fun findByGiverIdOrReceiverId(giverId: Long, receiverId: Long): List<Match>
    fun findMatchedByGiverId(giverId: Long): List<Match>
}
