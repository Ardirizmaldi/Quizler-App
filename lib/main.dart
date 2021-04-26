import 'package:flutter/material.dart';
import 'package:quizzler/widgets/quizBrain.dart';
import 'package:quizzler/widgets/iconAnswer.dart';
import 'package:quizzler/widgets/quizConstants.dart';
import 'package:quizzler/widgets/quizAlertModal.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();
  IconAnswer iconAnswer = IconAnswer();
  ModalConfirmQuiz modalConfirm = ModalConfirmQuiz();

  List<Icon> scoreKeeper = [];
  int totalCorrectAnswer = 0;

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuizAnswer();

    setState(() {
      if (quizBrain.onFinishedQuestion()) {
        Function restartQuiz = () {
          setState(
            () {
              Navigator.pop(context);
              scoreKeeper = [];
              totalCorrectAnswer = 0;
              quizBrain.questionNumber = 0;
            },
          );
        };

        modalConfirm.getModalRestartQuiz(
            context, totalCorrectAnswer, restartQuiz);
      }

      if (userAnswer == correctAnswer) {
        totalCorrectAnswer++;
        scoreKeeper.add(
          iconAnswer.getIcon(true),
        );
      } else {
        scoreKeeper.add(
          iconAnswer.getIcon(false),
        );
      }
      setState(() {
        quizBrain.nextQuestion();
      });
    });
  }

  Widget quizBody(String quizText) {
    return Padding(
      padding: EdgeInsets.all(QuizConstants.bodyPadding),
      child: Center(
        child: Text(
          quizText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: QuizConstants.fontQuestion,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget quizButton(bool answer) {
    return Padding(
      padding: EdgeInsets.all(QuizConstants.btnPadding),
      child: FlatButton(
        color: answer ? Colors.green : Colors.red,
        child: Text(
          answer ? QuizConstants.btnTrue : QuizConstants.btnFalse,
          style: TextStyle(
            fontSize: QuizConstants.btnText,
            color: Colors.white,
          ),
        ),
        onPressed: () => checkAnswer(answer ? true : false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: quizBody(
            quizBrain.getQuizText(),
          ),
        ),
        Expanded(
          child: quizButton(true),
        ),
        Expanded(
          child: quizButton(false),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
