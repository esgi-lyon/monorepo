package com.abclever.integrationtesting

val apps: Map<String, String> =
    mapOf(
        "auth" to "http://0.0.0.0:8082",
        "auth-server" to "http://0.0.0.0:3333",
        "gamification" to "http://localhost:8083",
        "gateway" to "http://localhost:8080",
        "quizz" to "http://localhost:8085",
        "statistic" to "http://localhost:8086")
