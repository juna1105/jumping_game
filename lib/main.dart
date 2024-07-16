import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:jumping_game/src/game.dart';

void main() {
  final game = JumpGame();
  runApp(
    GameWidget(game: game),
  );
}
