package com.abclever.gamification.web;


import com.abclever.gamification.repository.UserAnswer;
import com.abclever.gamification.repository.UserAnswerRepository;
import com.abclever.gamification.service.Statistic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.UUID;

@RestController
@RequestMapping("/")
public class UserAnswerController {

  private UserAnswerRepository userAnswerRepository;


  private Statistic statistic;

  public UserAnswerController(@Autowired UserAnswerRepository userAnswerRepository) {
    statistic = new Statistic(userAnswerRepository);
    this.userAnswerRepository = userAnswerRepository;
  }



  @PostMapping("user-answers")
  public ResponseEntity<UserAnswer> create(@RequestBody UserAnswerDto userAnswerDto) {
    UserAnswer userAnswer = new UserAnswer();
    userAnswer.setId(UUID.randomUUID());
    userAnswer.setCorrect(userAnswerDto.correct());
    userAnswer.setAnswer(userAnswerDto.answer());
    userAnswer.setUserId(UUID.fromString(userAnswerDto.userId()));
    userAnswer.setQuestion(userAnswerDto.question());
    userAnswer.setTime(userAnswerDto.time());
    this.userAnswerRepository.save(userAnswer);
   return ResponseEntity.ok(userAnswer);
  }

  @GetMapping("user-answers/{id}")
  public ResponseEntity<UserAnswer> get(@PathVariable UUID id){
   return this.userAnswerRepository.findById(id)
     .map(ResponseEntity::ok)
     .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "UserAnswer not found"));
  }

  @GetMapping("user-answers")
  public Iterable<UserAnswer> getAll(@RequestParam(name = "userId") UUID userId){
    return userAnswerRepository.findAllByUserId(userId);
  }

  @GetMapping("stats")
  public StatisticDto getStat(@RequestParam(name = "userId") UUID userId) {
    return statistic.getStat(userId);
  }
}
