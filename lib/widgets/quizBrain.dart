import 'package:quizzler/validator/question.dart';

class QuizBrain {
  int questionNumber = 0;

  List<Question> _questionBank = [
    Question(
      'You can lead a cow down stairs but not up stairs.',
      false,
    ),
    Question(
      'Approximately one quarter of human bones are in the feet.',
      true,
    ),
    Question(
      'A slug\'s blood is green.',
      true,
    ),
    Question(
      'Some cats are actually allergic to humans',
      true,
    ),
    Question(
      'You can lead a cow down stairs but not up stairs.',
      false,
    ),
    Question(
      'Approximately one quarter of human bones are in the feet.',
      true,
    ),
    Question(
      'A slug\'s blood is green.',
      true,
    ),
    Question(
      'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
      true,
    ),
    Question(
      'It is illegal to pee in the Ocean in Portugal.',
      true,
    ),
    Question(
      'No piece of square dry paper can be folded in half more than 7 times.',
      false,
    ),
    Question(
      'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      true,
    ),
    Question(
      'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      false,
    ),
    Question(
      'The total surface area of two human lungs is approximately 70 square metres.',
      true,
    ),
  ];

  bool onFinishedQuestion() => questionNumber == _questionBank.length - 1;

  void nextQuestion() {
    if (questionNumber < _questionBank.length - 1) {
      questionNumber++;
    }
  }

  String getQuizText() {
    return _questionBank[questionNumber].questionText;
  }

  bool getQuizAnswer() {
    return _questionBank[questionNumber].questionAnswer;
  }
}
