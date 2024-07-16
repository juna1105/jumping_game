import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:jumping_game/src/components/components.dart';
import 'package:jumping_game/src/config.dart';

class JumpGame extends FlameGame {
  JumpGame()
      : super(
            camera: CameraComponent.withFixedResolution(
          width: gameWidth,
          height: gameHeight,
        ));
  @override
  FutureOr<void> onLoad() async {
    print(camera.viewfinder.anchor);
    final playerSprite = await images.load('player.png');
    final background = await images.load('background.png');
    // TODO: implement onLoad

    await world.add(BackGround(sprite: Sprite(background)));
    await world.add(Player(sprite: Sprite(playerSprite)));
    return super.onLoad();
  }
}
