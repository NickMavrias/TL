package com.example.demo.service.impl

import com.example.demo.dto.*
import org.springframework.stereotype.Service
import com.example.demo.entity.Feed
import com.example.demo.entity.Match
import com.example.demo.entity.Report
import com.example.demo.mapper.*
import com.example.demo.repository.*
import com.example.demo.service.StudentService
import org.springframework.transaction.annotation.Transactional

@Service
class StudentServiceImpl(
    private val studentRepository: StudentsRepository,
    private val userRepository: UsersRepository,
    private val matchRepository: MatchRepository,
    private val feedRepository: FeedRepository,
    private val reportRepository: ReportRepository,
    private val evaluateStudentRepository: EvaluateStudentRepository,
    private val evaluateCafeRepository: EvaluateCafeRepository,
    private val userMapper: UserMapper,
    private val studentMapper: StudentMapper,
//    private val studentNameAndPhotosMapper: StudentNameAndPhotosMapper,
    private val evaluateCafeMapper: EvaluateCafeMapper,
    private val evaluateStudentMapper: EvaluateStudentMapper
) : StudentService {

    @Transactional
    override fun createStudent(studentDto: StudentDto): StudentDto {
        val userEntity = userMapper.toEntity(studentDto.user)
        userEntity.role = Role.STUDENT
        val savedUser = userRepository.save(userEntity)
        val studentEntity = studentMapper.toEntity(studentDto)
        studentEntity.user = savedUser
        val createdStudent = studentRepository.save(studentEntity)
        return studentMapper.toDto(createdStudent)
    }

//    @Transactional(readOnly = true)
//    override fun getOtherStudents(currentUserId: Long): List<StudentNameAndPhotosDto> {
//        return studentRepository.findAll()
//            .filter { it.user.id != currentUserId }
//            .map { student ->
//                studentNameAndPhotosMapper.toDto(student)
//            }
//    }

//    @Transactional(readOnly = true)
//    override fun getMatchedStudents(currentUserId: Long): List<StudentNameAndPhotosDto> {
//        val matches = matchRepository.findByGiverIdOrReceiverId(currentUserId, currentUserId)
//        val matchedStudentIds = matches.flatMap {
//            listOf(it.giver.id, it.receiver.id)
//        }.filterNot { it == currentUserId }
//
//        return studentRepository.findAllById(matchedStudentIds)
//            .map { studentNameAndPhotosMapper.toDto(it) }
//    }

//    @Transactional(readOnly = true)
//    override fun getStudentsByIds(studentIds: List<Long>): List<StudentNameAndPhotosDto> {
//        return studentRepository.findAllById(studentIds)
//            .map { student ->
//                studentNameAndPhotosMapper.toDto(student)
//            }
//    }

//    @Transactional(readOnly = true)
//    override fun getAllStudentsExcept(studentIds: List<Long>): List<StudentNameAndPhotosDto> {
//        return studentRepository.findAll()
//            .filterNot { student ->
//                student.id in studentIds
//            }
//            .map { student ->
//                studentNameAndPhotosMapper.toDto(student)
//            }
//    }

    @Transactional
    override fun likeStudent(giverId: Long, receiverId: Long) {
        val existingMatch = matchRepository.findByGiverIdAndReceiverId(giverId, receiverId)
            ?: matchRepository.findByGiverIdAndReceiverId(receiverId, giverId)

        if (existingMatch != null) {
            existingMatch.isMatch = true
            matchRepository.save(existingMatch)
        } else {
            val newMatch = Match(
                giver = studentRepository.findById(giverId).orElseThrow { RuntimeException("Giver not found") },
                receiver = studentRepository.findById(receiverId).orElseThrow { RuntimeException("Receiver not found") },
                isMatch = false
            )
            matchRepository.save(newMatch)
        }

        val existingFeed = feedRepository.findByGiverIdAndReceiverId(giverId, receiverId)
            ?: feedRepository.findByGiverIdAndReceiverId(receiverId, giverId)

        if (existingFeed != null) {
            feedRepository.delete(existingFeed)
        } else {
            val newFeed = Feed(
                giver = studentRepository.findById(giverId).orElseThrow { RuntimeException("Giver not found") },
                receiver = studentRepository.findById(receiverId).orElseThrow { RuntimeException("Receiver not found") },
                weight = true
            )
            feedRepository.save(newFeed)
        }
    }

    @Transactional
    override fun dislikeStudent(giverId: Long, receiverId: Long) {
        val existingFeed = feedRepository.findByGiverIdAndReceiverId(giverId, receiverId)
            ?: feedRepository.findByGiverIdAndReceiverId(receiverId, giverId)

        if (existingFeed != null) {
            existingFeed.weight = false
            feedRepository.save(existingFeed)
        } else {
            val newFeed = Feed(
                giver = studentRepository.findById(giverId).orElseThrow { RuntimeException("Giver not found") },
                receiver = studentRepository.findById(receiverId).orElseThrow { RuntimeException("Receiver not found") },
                weight = false
            )
            feedRepository.save(newFeed)
        }
    }

    @Transactional
    override fun superLikeStudent(giverId: Long, receiverId: Long) {
        val existingMatch = matchRepository.findByGiverIdAndReceiverId(giverId, receiverId)
            ?: matchRepository.findByGiverIdAndReceiverId(receiverId, giverId)

        if (existingMatch != null) {
            existingMatch.isMatch = true
            matchRepository.save(existingMatch)
        } else {
            val newMatch = Match(
                giver = studentRepository.findById(giverId).orElseThrow { RuntimeException("Giver not found") },
                receiver = studentRepository.findById(receiverId)
                    .orElseThrow { RuntimeException("Receiver not found") },
                isMatch = true
            )
            matchRepository.save(newMatch)
        }
    }

    @Transactional
    override fun unMatchStudent(loggedInUserId: Long, otherStudentId: Long) {
        val existingMatch = matchRepository.findByGiverIdAndReceiverId(loggedInUserId, otherStudentId)
            ?: matchRepository.findByGiverIdAndReceiverId(otherStudentId, loggedInUserId)

        if (existingMatch != null) {
            existingMatch.isMatch = false
            matchRepository.save(existingMatch)
        } else {
            throw RuntimeException("Match not found between the given students")
        }
    }

    @Transactional
    override fun reportStudent(loggedInUserId: Long, reportDto: ReportDto) {
        val reporter = userRepository.findById(loggedInUserId).orElseThrow { RuntimeException("Reporter not found") }
        val reportedPerson = userRepository.findById(reportDto.reportedPersonId).orElseThrow { RuntimeException("Reported person not found") }

        // Create a new report
        val report = Report(
            reporter = reporter,
            reportedPerson = reportedPerson,
            context = reportDto.context
        )
        reportRepository.save(report)

        // MPOROUME GIA KALUTERH APODOSH NA TSEKAROUME AN REPORTER IS STUDENT PRIN ARXISEI NA PSAXNEI
        // OLO TO TABLE MATCH
        // Check if a match exists between the reporter and the reported person
        val match = matchRepository.findByGiverIdAndReceiverId(loggedInUserId, reportDto.reportedPersonId)
            ?: matchRepository.findByGiverIdAndReceiverId(reportDto.reportedPersonId, loggedInUserId)

        if (match != null) {
            match.isMatch = false
            matchRepository.save(match)
        }
    }

    @Transactional(readOnly = true)
    override fun getEvaluationsByEvaluatorId(evaluatorId: Long): EvaluationsDto {
        val cafeEvaluations = evaluateCafeRepository.findByEvaluatorId(evaluatorId)
            .map { evaluateCafeMapper.toDto(it) }
        val studentEvaluations = evaluateStudentRepository.findByEvaluatorId(evaluatorId)
            .map { evaluateStudentMapper.toDto(it) }
        return EvaluationsDto(studentEvaluations, cafeEvaluations)
    }
}