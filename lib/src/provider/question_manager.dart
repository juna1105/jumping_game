import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:jumping_game/src/config.dart';

class QuestionManager extends ChangeNotifier {
  late List<ButtonType> questionOrder;
  late List<Color> colorOrder;

  QuestionManager() {
    questionOrder = List<ButtonType>.generate(
      4,
      (int index) {
        int randomNumber = Random().nextInt(4);
        switch (randomNumber) {
          case 0:
            return ButtonType.tl;
          case 1:
            return ButtonType.tr;
          case 2:
            return ButtonType.bl;
          case 3:
            return ButtonType.br;
          default:
            throw Exception('Unexpected randomNumber: $randomNumber');
        }
      },
      growable: false,
    );

    colorOrder = List<Color>.generate(
      4,
      (int index) {
        switch (questionOrder[index]) {
          case ButtonType.tl:
            return Colors.red;
          case ButtonType.tr:
            return Colors.blue;
          case ButtonType.bl:
            return Colors.green;
          case ButtonType.br:
            return Colors.yellow;
          default:
            return Colors.transparent;
        }
      },
      growable: false,
    );
  }
  void refreshQuestionOrder() {
    questionOrder = List<ButtonType>.generate(
      4,
      (int index) {
        int randomNumber = Random().nextInt(4);
        switch (randomNumber) {
          case 0:
            return ButtonType.tl;
          case 1:
            return ButtonType.tr;
          case 2:
            return ButtonType.bl;
          case 3:
            return ButtonType.br;
          default:
            throw Exception('Unexpected randomNumber: $randomNumber');
        }
      },
      growable: false,
    );
    colorOrder = List<Color>.generate(
      4,
      (int index) {
        switch (questionOrder[index]) {
          case ButtonType.tl:
            return Colors.red;
          case ButtonType.tr:
            return Colors.blue;
          case ButtonType.bl:
            return Colors.green;
          case ButtonType.br:
            return Colors.yellow;
          default:
            return Colors.transparent;
        }
      },
      growable: false,
    );
  }

  void refreshEffectOrder() {
    effectOrder = List<Effect<dynamic>>.generate(
      4,
      (int index) => FadeEffect(duration: 1000.ms),
    );
  }

  List<Effect<dynamic>> effectOrder = List<Effect<dynamic>>.generate(
    4,
    (int index) => FadeEffect(duration: 1000.ms),
  );

  int count = 0;

  void setQuestionOrder(List<ButtonType> questionOrder) {
    this.questionOrder = questionOrder;
    notifyListeners();
  }

  ReactType checkCorrectAnswer(ButtonType input, int order) {
    if (questionOrder[order] == input) {
      count++;
      if (count == 4) {
        count = 0;
        refreshQuestionOrder();
        refreshEffectOrder();
        notifyListeners();

        return ReactType.jump;
      } else {
        effectOrder[order] = const BlurEffect();
        notifyListeners();
        return ReactType.good;
      }
    } else {
      count = 0;
      refreshEffectOrder();
      notifyListeners();
      return ReactType.bad;
    }
  }
}
