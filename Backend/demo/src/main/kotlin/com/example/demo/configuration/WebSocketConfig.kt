package com.example.demo.configuration

import org.slf4j.LoggerFactory
import org.springframework.context.annotation.Configuration
import org.springframework.messaging.simp.config.MessageBrokerRegistry
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker
import org.springframework.web.socket.config.annotation.StompEndpointRegistry
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer

@Configuration
@EnableWebSocketMessageBroker
class WebSocketConfig : WebSocketMessageBrokerConfigurer {

    private val logger = LoggerFactory.getLogger(WebSocketConfig::class.java)

    override fun configureMessageBroker(config: MessageBrokerRegistry) {
        logger.info("Configuring message broker")
        config.enableSimpleBroker("/topic")
        config.setApplicationDestinationPrefixes("/app")
    }

    override fun registerStompEndpoints(registry: StompEndpointRegistry) {
        logger.info("Registering STOMP endpoints")
        registry.addEndpoint("/ws")
            .setAllowedOriginPatterns("*")  // Use allowedOriginPatterns instead of allowedOrigins
            .withSockJS()
    }
}
