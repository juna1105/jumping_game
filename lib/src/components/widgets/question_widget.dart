import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jumping_game/src/config.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late final List<ButtonType> btnList;
  @override
  void initState() {
    btnList = List<ButtonType>.generate(
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < btnList.length; i++)
          Row(
            children: [
              AnswerBox(
                btnType: btnList[i],
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
      ],
    );
  }
}

class AnswerBox extends StatelessWidget {
  const AnswerBox({
    super.key,
    required this.btnType,
  });
  final ButtonType btnType;
  Color _getBackgroundColor(ButtonType btnType) {
    switch (btnType) {
      case ButtonType.tl:
        return Colors.red;
      case ButtonType.tr:
        return Colors.blue;
      case ButtonType.bl:
        return Colors.green;
      case ButtonType.br:
        return Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: _getBackgroundColor(btnType),
    );
  }
}
