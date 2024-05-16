package com.example.demo.repository

import com.example.demo.entity.Link
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface LinksRepository : JpaRepository<Link, Long>