<<<<<<< HEAD

=======
import 'dart:ffi';
>>>>>>> b5ad921 (fix: build on quizz part 1 (#15))

class Quizz {
  final List<Question> questions;

  Quizz(this.questions);

  static Quizz fromJson(Map<String, dynamic> json) {
    return Quizz(List.empty());
  }
}

class Question {
   final String letter;
   final Uri imagePath;
   final QuestionType questionType;
   final Map<String, Uri> proposal;

   Question(this.letter, this.imagePath, this.questionType, this.proposal);
}


enum QuestionType {
  letter, image;

  static fromJson(Map<String, dynamic> json) {

  }
}

// TODO Refacto
