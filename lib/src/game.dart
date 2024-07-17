import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:jumping_game/src/components/components.dart';
import 'package:jumping_game/src/config.dart';

class JumpGame extends Forge2DGame {
  JumpGame()
      : super(
          zoom: 1.0,
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );
  @override
  FutureOr<void> onLoad() async {
    await world.add(BackGround());
    await world.add(PlayerForge2d(Sprite(
      await images.load('player.png'),
    )));
    return super.onLoad();
  }
}
