import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:jumping_game/src/components/button.dart';
import 'package:jumping_game/src/components/components.dart';
import 'package:jumping_game/src/components/floor.dart';
import 'package:jumping_game/src/config.dart';

class JumpGame extends Forge2DGame with HasCollisionDetection, TapDetector {
  late PlayerForge2d player;
  final puaseOverlayIdentifier = 'kim';
  JumpGame()
      : super(
          gravity: Vector2(0, 100),
          zoom: 1.0,
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    overlays.add(puaseOverlayIdentifier);
    await world.add(BackGround());
    await world.add(Floor());
    await world.add(InputButton(buttonType: ButtonType.tr));
    player = PlayerForge2d(
      Sprite(
        await images.load('player.png'),
      ),
    );
    await world.add(player);
    camera.follow(player);
  }
}
