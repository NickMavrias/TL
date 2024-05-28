package com.example.demo.repository

import com.example.demo.entity.Match
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@Repository
interface MatchRepository : JpaRepository<Match, Long> {
    fun findByGiverIdAndReceiverId(giverId: Long, receiverId: Long): Match?
    fun findByGiverIdOrReceiverId(giverId: Long, receiverId: Long): List<Match>
    fun findMatchedByGiverId(giverId: Long): List<Match>
    @Query("SELECT m FROM Match m WHERE (m.giver.id = 1) AND m.isMatch = true")
    fun findByGiverIdOrReceiverIdAndIsMatchTrue(@Param("userId") userId: Long): List<Match>
    @Query("SELECT m.receiver.id FROM Match m WHERE m.giver.id = :userId AND m.isMatch = true")
    fun findLikedStudentIds(@Param("userId") userId: Long): List<Long>
}
