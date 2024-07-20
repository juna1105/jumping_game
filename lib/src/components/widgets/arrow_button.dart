import 'package:flutter/material.dart';
import 'package:jumping_game/src/config.dart';

class ButtonArea extends StatelessWidget {
  const ButtonArea({
    super.key,
    required this.inputString,
  });
  final ValueNotifier<String> inputString;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ArrowButton(
              btnType: ButtonType.tl,
              inputString: inputString,
            ),
            ArrowButton(
              btnType: ButtonType.tr,
              inputString: inputString,
            ),
          ],
        ),
        Row(
          children: [
            ArrowButton(
              btnType: ButtonType.bl,
              inputString: inputString,
            ),
            ArrowButton(
              btnType: ButtonType.br,
              inputString: inputString,
            ),
          ],
        ),
      ],
    );
  }
}

class ArrowButton extends StatelessWidget {
  ArrowButton({
    super.key,
    required this.btnType,
    this.inputString,
  });
  ValueNotifier<String>? inputString;

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
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _getBackgroundColor(btnType),
        minimumSize: const Size(
          150,
          150,
        ),
      ),
      onPressed: () {
        if (inputString != null) {
          inputString!.value += btnType.toString();
          print(inputString);
        }
      },
      child: Text(
        btnType.toString(),
      ),
    );
  }
}
