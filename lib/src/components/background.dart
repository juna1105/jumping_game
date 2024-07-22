import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:jumping_game/src/game.dart';

class BackGround extends SpriteComponent with HasGameReference<JumpGame> {
  BackGround()
      : super(
          anchor: Anchor.center,
          paint: Paint()
            ..color = Colors.white
            ..style = PaintingStyle.fill,
        );
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    final image = await game.images.load('background.png');
    sprite = Sprite(image);
    size = Vector2(game.width, 10000);
  }
}
