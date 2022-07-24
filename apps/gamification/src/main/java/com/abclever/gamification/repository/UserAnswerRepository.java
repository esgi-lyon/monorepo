package com.abclever.gamification.repository;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import java.util.List;
import java.util.UUID;

public interface UserAnswerRepository extends ElasticsearchRepository<UserAnswer, UUID> {

  public List<UserAnswer> findAllByUserId(UUID userId);
  public int countAllByUserId(UUID userId);
  public int countAllByUserIdAndCorrect(UUID userId, boolean answer);

}
