import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:jumping_game/src/components/components.dart';
import 'package:jumping_game/src/components/floor.dart';
import 'package:jumping_game/src/config.dart';

class JumpGame extends Forge2DGame with HasCollisionDetection, TapDetector {
  JumpGame()
      : super(
          gravity: Vector2(0, 100),
          zoom: 10.0,
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    await world.add(BackGround());
    await world.add(Floor());
    PlayerForge2d player = PlayerForge2d(
      Sprite(
        await images.load('player.png'),
      ),
    );
    await world.add(player);
    camera.follow(player);
  }
}
