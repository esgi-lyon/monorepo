package com.abclever.gamification.repository;

import org.apache.catalina.User;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import java.util.List;
import java.util.UUID;

public interface UserAnswerRepository extends ElasticsearchRepository<UserAnswer, UUID> {

  public List<UserAnswer> findAllByUserId(long userId);
  public int countAllByUserId(long userId);
  public int countAllByUserIdAndCorrect(long userId, boolean answer);

}
