package com.abclever.gamification.repository;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import java.util.UUID;

public interface UserAnswerRepository extends ElasticsearchRepository<UserAnswer, UUID> {
}
