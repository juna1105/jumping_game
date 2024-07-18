import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:jumping_game/src/config.dart';
import 'package:jumping_game/src/game.dart';

class InputButton extends RectangleComponent
    with HasGameReference<JumpGame>, TapCallbacks {
  InputButton({required this.buttonType})
      : super(
          size: btnSize,
          anchor: Anchor.center,
          paint: Paint()..style = PaintingStyle.fill,
          position: Vector2(
            0,
            gameHeight / 4,
          ),
        );
  final ButtonType buttonType;

  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    switch (buttonType) {
      case ButtonType.tl:
        paint.color = Colors.red;
      case ButtonType.tr:
        paint.color = Colors.blue;
      case ButtonType.bl:
        paint.color = Colors.yellow;
      case ButtonType.br:
        paint.color = Colors.green;
    }
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    final playerBody = game.player.body;
    playerBody.linearVelocity = Vector2.all(0);
    playerBody.applyLinearImpulse(Vector2(0, -100000000));
    // TODO: implement onTapDown
    super.onTapDown(event);
  }
}
