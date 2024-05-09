package com.example.demo.controller

import com.example.demo.dto.UserDto
import com.example.demo.service.UserService
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/users")
class UserController(private val userService: UserService) {

    // Build Add User REST API
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

    // Build Get All Users REST API
    @GetMapping
    fun getAllUsers(): ResponseEntity<List<UserDto>> {
        val users: List<UserDto> = userService.getAllUsers()
        return ResponseEntity.ok(users)
    }

    @PutMapping("/{id}")
    fun updateUser(@PathVariable("id") userId: Long,
                   @RequestBody updatedUser: UserDto): ResponseEntity<UserDto> {
        val userDto = userService.updateUser(userId, updatedUser)
        return ResponseEntity.ok(userDto)
    }

    // Build Delete User REST API
    @DeleteMapping("{id}")
    fun deleteUser(@PathVariable("id") userId: Long): ResponseEntity<String> {
        userService.deleteUser(userId)
        return ResponseEntity.ok("User deleted successfully!")
    }

    // Build Login REST API
    @PostMapping("/login")
    fun loginUser(@RequestBody credentials: Map<String, String>): String {
        val username = credentials["username"]
        val password = credentials["password"]
        if (username != null && password != null) {
            return userService.loginUser(username, password)
        }
        return "no"
    }
}
