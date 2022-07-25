import '../providers/quizz_provider.dart';

class QuizzRepository {

  final QuizzProvider _quizzProvider = QuizzProvider();

  get() async{
    return await _quizzProvider.getQuizz(15);
  }

 /* submit() async {
    await _quizzProvider.submitQuizz();
  }*/

}
