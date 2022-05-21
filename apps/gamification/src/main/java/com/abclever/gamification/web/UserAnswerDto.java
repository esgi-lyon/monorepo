package com.abclever.gamification.web;

record UserAnswerDto(boolean correct, String answer, Long userId, String question){}
