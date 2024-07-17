import 'dart:async';

import 'package:flame/components.dart';
import 'package:jumping_game/src/game.dart';

class BackGround extends SpriteComponent with HasGameReference<JumpGame> {
  BackGround()
      : super(
          anchor: Anchor.center,
        );
  @override
  FutureOr<void> onLoad() async {
    final image = await game.images.load('background.png');
    sprite = Sprite(image);
    size = Vector2(game.size.x, game.size.y);
    return super.onLoad();
  }
}
