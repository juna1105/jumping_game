import 'dart:async';

import 'package:flame/components.dart';
import 'package:jumping_game/src/config.dart';
import 'package:jumping_game/src/game.dart';

class Player extends SpriteComponent with HasGameReference<JumpGame> {
  Player({required super.sprite})
      : super(
          anchor: Anchor.center,
          position: Vector2(-300, 0),
          size: Vector2(playerWidth, playerHeight),
        );
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
  }
}
