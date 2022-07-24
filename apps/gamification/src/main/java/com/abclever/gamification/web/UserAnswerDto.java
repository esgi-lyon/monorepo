package com.abclever.gamification.web;

record UserAnswerDto(boolean correct, String answer, String userId, String question, Double time){}
