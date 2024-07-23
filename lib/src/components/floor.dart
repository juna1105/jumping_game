import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:jumping_game/src/config.dart';

class Floor extends BodyComponent with ContactCallbacks {
  Floor({required this.position, required this.color})
      : super(
          children: [
            RectangleComponent(
              anchor: Anchor.center,
              paint: Paint()
                ..color = color
                ..style = PaintingStyle.fill,
              size: floorSize,
            )
          ],
        );
  final Color color;
  @override
  final Vector2 position;

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      position: position,
      type: BodyType.static,
    );
    final fixtureDef = FixtureDef(
      PolygonShape()
        ..setAsBox(
          floorSize.x / 2,
          floorSize.y / 2,
          Vector2(0, 0),
          0,
        ),
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    print(DateTime.now().millisecondsSinceEpoch);
    super.beginContact(other, contact);
  }

  @override
  void onRemove() {
    // TODO: implement onRemove
    super.onRemove();
  }
}
