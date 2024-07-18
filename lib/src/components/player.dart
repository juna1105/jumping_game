import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:jumping_game/src/config.dart';
import 'package:jumping_game/src/game.dart';

class PlayerForge2d extends BodyComponent<JumpGame>
    with ContactCallbacks, TapCallbacks {
  PlayerForge2d(Sprite sprite)
      : super(
          renderBody: false,
          children: [
            SpriteComponent(
              sprite: sprite,
              anchor: Anchor.center,
              size: Vector2(
                playerWidth,
                playerHeight,
              ),
            ),
          ],
        );

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      position: Vector2(0, -gameHeight / 4),
      type: BodyType.dynamic,
    );
    final fixtureDef = FixtureDef(
      PolygonShape()
        ..setAsBox(
          playerWidth / 2,
          playerHeight / 2,
          Vector2(0, 0),
          0.0,
        ),
      density: 100,
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void onTapDown(TapDownEvent event) {
    // TODO: implement onTapDown
    super.onTapDown(event);
  }

  @override
  void beginContact(Object other, Contact contact) {
    // TODO: implement beginContact
    print('I M PLAYER');
    super.beginContact(other, contact);
  }
}
