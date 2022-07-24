package com.abclever.gamification.service;

import com.abclever.gamification.repository.UserAnswerRepository;
import com.abclever.gamification.web.StatisticDto;
import org.springframework.beans.factory.annotation.Autowired;


public class Statistic {

  UserAnswerRepository userAnswerRepository;

  public Statistic(UserAnswerRepository userAnswerRepository) {

    this.userAnswerRepository = userAnswerRepository;

  }


  public StatisticDto getStat(long userId) {

    int nbQuestionAnswered  = userAnswerRepository.countAllByUserId(userId);
    double ratioCorrectAnswer = userAnswerRepository.countAllByUserIdAndAnswer(userId, true) / nbQuestionAnswered;
    return new StatisticDto(
      nbQuestionAnswered = nbQuestionAnswered,
      ratioCorrectAnswer = ratioCorrectAnswer
    );
  }
}
