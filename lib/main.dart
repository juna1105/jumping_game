import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:jumping_game/src/components/widgets/arrow_button.dart';
import 'package:jumping_game/src/game.dart';

void main() {
  runApp(
    const MyWidget(),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GameWidget.controlled(
          gameFactory: JumpGame.new,
          loadingBuilder: (p0) {
            print('로딩중..');
            return Container(
              child: const Text(
                '로딩중...',
                style: TextStyle(fontSize: 200),
              ),
            );
          },
          overlayBuilderMap: {
            'inputBtn': (BuildContext context, JumpGame game) => Align(
                  alignment: Alignment.center,
                  child: ButtonArea(
                    inputString: game.input,
                  ),
                )
          },
        ),
      ),
    );
  }
}
