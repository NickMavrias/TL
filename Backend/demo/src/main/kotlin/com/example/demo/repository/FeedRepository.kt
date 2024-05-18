package com.example.demo.repository

import com.example.demo.entity.Feed
import com.example.demo.entity.Match
import com.example.demo.entity.Student
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface FeedRepository : JpaRepository<Feed, Long> {}
