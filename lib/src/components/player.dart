import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:jumping_game/src/config.dart';

class PlayerForge2d extends BodyComponent {
  PlayerForge2d(Sprite sprite)
      : super(
          fixtureDefs: [
            FixtureDef(
              PolygonShape()
                ..setAsBox(
                    playerWidth / 2, playerHeight / 2, Vector2(0, 0), 0.0),
            ),
          ],
          bodyDef: BodyDef(
            type: BodyType.dynamic,
          ),
          children: [
            SpriteComponent(
              sprite: sprite,
              anchor: Anchor.center,
              size: Vector2(
                playerWidth,
                playerHeight,
              ),
            )
          ],
        );
}
