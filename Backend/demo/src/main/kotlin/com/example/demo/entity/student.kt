package com.example.demo.entity

import jakarta.persistence.*
import java.time.LocalDate

enum class Gender {
    MALE,
    FEMALE,
    OTHER
}

enum class Interests {
    Γυμναστήριο,
    Επιτραπέζια,
    Dnd
}

@Entity
@Table(name = "students")
data class Student(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long,

    @Column(name = "email", nullable = false, unique = true)
    var email: String,

    @Column(name = "phone", nullable = false)
    var phone: String,

    @Column(name = "fullname", nullable = false)
    var fullname: String,

    @Column(name = "birthday", nullable = false)
    val birthday: LocalDate,

    @Column(name = "gender", nullable = false)
    @Enumerated(EnumType.STRING)
    val gender: Gender,

    @Column(name = "want_email", nullable = false)
    var wantEmail: Boolean,

    @Column(name = "bio", nullable = false, length = 1000)
    var bio: String,

    @Column(name = "interests", nullable = false)
    @Enumerated(EnumType.STRING)
    var interests: Interests,

    @Column(name = "university", nullable = false)
    var university: String,

    @Column(name = "department", nullable = false)
    var department: String,

    @Column(name = "etos", nullable = false)
    var etos: String,

    @Column(name = "email_notification", nullable = false)
    var emailNotification: Boolean,

    @Column(name = "push_notification", nullable = false)
    var pushNotification: Boolean,

    @Column(name = "sms_notification", nullable = false)
    var smsNotification: Boolean,

    @OneToOne(cascade = [CascadeType.ALL])
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    var user: User,

    @OneToMany(mappedBy = "student", cascade = [CascadeType.ALL], orphanRemoval = true)
    var images: MutableList<Image> = mutableListOf() // Define a list of links associated with the student
)

