package com.abclever.gamification.service;

import com.abclever.gamification.repository.UserAnswer;
import com.abclever.gamification.repository.UserAnswerRepository;
import com.abclever.gamification.web.StatisticDto;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


public class Statistic {

  UserAnswerRepository userAnswerRepository;

  public Statistic(UserAnswerRepository userAnswerRepository) {

    this.userAnswerRepository = userAnswerRepository;

  }


  public StatisticDto getStat(long userId) {

    int nbQuestionAnswered  = userAnswerRepository.countAllByUserId(userId);
    double ratioCorrectAnswer = (userAnswerRepository.countAllByUserIdAndCorrect(userId, true) * 1F) / nbQuestionAnswered;
    return new StatisticDto(nbQuestionAnswered, ratioCorrectAnswer);
  }
}
