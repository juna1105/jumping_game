import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:jumping_game/src/config.dart';
import 'package:jumping_game/src/game.dart';

class PlayerForge2d extends BodyComponent<JumpGame> with ContactCallbacks {
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
  void jump() {
    body.linearVelocity = Vector2.all(0);
    body.applyLinearImpulse(Vector2(0, -111110000000));
  }

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
  void beginContact(Object other, Contact contact) {
    // TODO: implement beginContact
    print('I M PLAYER');
    super.beginContact(other, contact);
  }
}
