import 'package:flutter/material.dart';
import 'package:quizzler/widgets/quizConstants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ModalConfirmQuiz {
  Future<bool> getModalRestartQuiz(
    BuildContext context,
    int totalCorrectAnswer,
    Function onPressFunction,
  ) {
    return Alert(
      context: context,
      type: AlertType.success,
      title: QuizConstants.alertTitle,
      desc: "${QuizConstants.alertDesc} $totalCorrectAnswer",
      buttons: [
        DialogButton(
          color: Colors.red,
          child: Text(
            QuizConstants.alertBtnText,
            style: TextStyle(
              color: Colors.white,
              fontSize: QuizConstants.alertBtnFont,
            ),
          ),
          onPressed: onPressFunction,
          width: QuizConstants.alertBtnSize,
        )
      ],
      closeFunction: onPressFunction,
    ).show();
  }
}
