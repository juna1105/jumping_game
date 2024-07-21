import 'package:flutter/material.dart';
import 'package:jumping_game/src/config.dart';
import 'package:jumping_game/src/game.dart';

class ButtonArea extends StatelessWidget {
  const ButtonArea({
    super.key,
    required this.game,
  });
  final JumpGame game;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ArrowButton(
                btnType: ButtonType.tl,
                game: game,
              ),
              ArrowButton(
                btnType: ButtonType.tr,
                game: game,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ArrowButton(
                btnType: ButtonType.bl,
                game: game,
              ),
              ArrowButton(
                btnType: ButtonType.br,
                game: game,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
    required this.btnType,
    required this.game,
  });

  final ButtonType btnType;
  final JumpGame game;
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(
            side: BorderSide(
          color: Colors.black,
          width: 2,
        )),
        backgroundColor: _getBackgroundColor(btnType),
        minimumSize: const Size(
          80,
          80,
        ),
      ),
      onPressed: () {
        game.player.jump();
      },
      child: Text(
        btnType.toString(),
      ),
    );
  }
}
