import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:jumping_game/src/game.dart';

class StartButton extends StatefulWidget {
  const StartButton({super.key, required this.game});
  final JumpGame game;

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  double width = 200;
  double height = 100;
  void changeBoxSize(double afterWidth, double afterHeight) {
    setState(() {
      width = afterWidth;
      height = afterHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTapDown: (details) {
          print(DateTime.now());
          changeBoxSize(width * 1.2, height * 1.2);
          widget.game.gameStart();
        },
        onTapUp: (details) => changeBoxSize(width / 1.2, height / 1.2),
        child: AnimatedContainer(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          width: width,
          height: height,
          duration: 300.ms,
          child: const Center(
            child: Text(
              'Game Start',
            ),
          ),
        ),
      ),
    );
  }
}
