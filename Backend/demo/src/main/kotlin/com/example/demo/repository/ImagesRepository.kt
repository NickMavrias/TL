package com.example.demo.repository

import com.example.demo.entity.Image
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface ImagesRepository : JpaRepository<Image, Long>