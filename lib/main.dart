import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:jumping_game/src/game.dart';

void main() {
  runApp(
    GameWidget.controlled(
      gameFactory: JumpGame.new,
    ),
  );
}
