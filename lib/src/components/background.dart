import 'package:flame/components.dart';
import 'package:jumping_game/src/config.dart';
import 'package:jumping_game/src/game.dart';

class BackGround extends SpriteComponent with HasGameReference<JumpGame> {
  BackGround({required super.sprite})
      : super(
          anchor: Anchor.center,
          size: Vector2(
            gameWidth,
            gameHeight,
          ),
        );
}
