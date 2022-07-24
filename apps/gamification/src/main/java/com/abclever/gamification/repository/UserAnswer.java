package com.abclever.gamification.repository;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;

import java.util.UUID;


@Document(indexName = "user-answers")
public class UserAnswer {

  @Id
  private UUID id;
  private boolean correct;
  private String answer;
  private Long userId;
  private String question;

  public UUID getId() {
    return id;
  }

  public void setId(UUID id) {
    this.id = id;
  }



  public boolean isCorrect() {
    return correct;
  }

  public void setCorrect(boolean correct) {
    this.correct = correct;
  }

  public String getAnswer() {
    return answer;
  }

  public void setAnswer(String answer) {
    this.answer = answer;
  }

  public Long getUserId() {
    return userId;
  }

  public void setUserId(Long userId) {
    this.userId = userId;
  }

  public String getQuestion() {
    return question;
  }

  public void setQuestion(String question) {
    this.question = question;
  }
}
