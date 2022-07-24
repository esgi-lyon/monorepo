package com.abclever.gamification.repository;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import java.util.List;
import java.util.UUID;

public interface UserAnswerRepository extends ElasticsearchRepository<UserAnswer, UUID> {

  public List<UserAnswer> findAllByUserId(long userId);
  public int countAllByUserId(long userId);
  public int countAllByUserIdAndAnswer(long userId, boolean answer);

}
