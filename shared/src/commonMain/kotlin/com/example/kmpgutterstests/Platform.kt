package com.example.kmpgutterstests

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform