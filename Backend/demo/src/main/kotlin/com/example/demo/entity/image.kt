package com.example.demo.entity

import jakarta.persistence.*

@Entity
@Table(name = "images")
data class Image(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long,
    @Lob
    val imageData: ByteArray,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id") // Define the foreign key column
    var student: Student // Define the many-to-one relationship with the student
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as Image

        if (id != other.id) return false
        if (!imageData.contentEquals(other.imageData)) return false
        if (student != other.student) return false

        return true
    }

    override fun hashCode(): Int {
        var result = id.hashCode()
        result = 31 * result + imageData.contentHashCode()
        result = 31 * result + student.hashCode()
        return result
    }
}