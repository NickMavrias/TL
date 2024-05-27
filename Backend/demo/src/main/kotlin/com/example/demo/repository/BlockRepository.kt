package com.example.demo.repository

import com.example.demo.entity.Block
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface BlockRepository : JpaRepository<Block, Long>
