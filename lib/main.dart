import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:jumping_game/src/components/widgets/arrow_button.dart';
import 'package:jumping_game/src/components/widgets/question_widget.dart';
import 'package:jumping_game/src/game.dart';

void main() {
  runApp(
    const MyWidget(),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GameWidget.controlled(
          gameFactory: JumpGame.new,
          loadingBuilder: (p0) {
            return const Text(
              '로딩중...',
              style: TextStyle(fontSize: 200),
            );
          },
          overlayBuilderMap: {
            'question': (BuildContext context, JumpGame game) =>
                const Positioned(
                  top: 10,
                  right: 10,
                  left: 10,
                  child: QuestionWidget(),
                ),
            'inputBtn': (BuildContext context, JumpGame game) => Positioned(
                  bottom: 10,
                  right: 10,
                  left: 10,
                  child: ButtonArea(
                    game: game,
                  ),
                )
          },
        ),
      ),
    );
  }
}
