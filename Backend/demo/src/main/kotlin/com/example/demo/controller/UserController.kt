package com.example.demo.controller

import com.example.demo.dto.UserDto
import com.example.demo.service.UserService
import jakarta.servlet.http.HttpSession
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/users")
class UserController(private val userService: UserService,
                     private val httpSession: HttpSession
) {

    @PostMapping
    fun createUser(@RequestBody userDto: UserDto): ResponseEntity<UserDto> {
        val savedUser = userService.createUser(userDto)
        return ResponseEntity(savedUser, HttpStatus.CREATED)
    }

    @GetMapping("{id}")
    fun getUserById(@PathVariable("id") userId: Long): ResponseEntity<UserDto> {
        val userDto: UserDto = userService.getUserById(userId)
        return ResponseEntity.ok(userDto)
    }

    @GetMapping
    fun getAllUsers(): ResponseEntity<List<UserDto>> {
        val users: List<UserDto> = userService.getAllUsers()
        return ResponseEntity.ok(users)
    }

    @GetMapping("/check-unique")
    fun checkUsernameOrEmailUnique(
        @RequestParam("username") username: String,
        @RequestParam("email") email: String
    ): ResponseEntity<String> {
        val responseMessage = userService.checkUsernameOrEmailUnique(username, email)
        return ResponseEntity.ok(responseMessage)
    }

    @PutMapping("/{id}")
    fun updateUser(@PathVariable("id") userId: Long,
                   @RequestBody updatedUser: UserDto): ResponseEntity<UserDto> {
        val userDto = userService.updateUser(userId, updatedUser)
        return ResponseEntity.ok(userDto)
    }

    @DeleteMapping("{id}")
    fun deleteUser(@PathVariable("id") userId: Long): ResponseEntity<String> {
        userService.deleteUser(userId)
        return ResponseEntity.ok("User deleted successfully!")
    }

    @PostMapping("/login")
    fun loginUser(@RequestBody credentials: Map<String, String>): ResponseEntity<String> {
        val identifier = credentials["identifier"]
        val password = credentials["password"]
        return if (identifier != null && password != null) {
            val loginResult = userService.loginUser(identifier, password)
            if (loginResult) {
                ResponseEntity.ok("Login successful")
            } else {
                ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid credentials")
            }
        } else {
            ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Identifier and password required")
        }
    }
}
