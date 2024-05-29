package com.example.demo.repository

import com.example.demo.entity.Feed
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface FeedRepository : JpaRepository<Feed, Long> {

    @Query("SELECT DISTINCT f.receiver.id FROM Feed f WHERE (f.giver.id = :userId OR f.receiver.id = :userId) AND f.weight = true")
    fun findPositiveInteractedStudentIds(@Param("userId") userId: Long): List<Long>

    @Query("SELECT f.receiver.id FROM Feed f WHERE f.giver.id = :userId")
    fun findAllReceiverIdsByGiverId(@Param("userId") userId: Long): List<Long>

    fun findByGiverIdAndReceiverId(giverId: Long, receiverId: Long): Feed?
}
