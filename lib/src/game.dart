import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:jumping_game/src/components/components.dart';
import 'package:jumping_game/src/config.dart';

enum PlayState { welcome, playing, gameOver }

class JumpGame extends Forge2DGame with HasCollisionDetection, TapDetector {
  late PlayerForge2d player;
  JumpGame() : super(zoom: 1.0, gravity: Vector2(0, 1000));
  double get width => size.x;
  double get height => size.y;
  late PlayState _playState;
  PlayState get playState => _playState;
  set playState(PlayState playState) {
    _playState = playState;
    switch (playState) {
      case PlayState.welcome:
        overlays.add('startBtn');
        overlays.remove('inputBtn');
        overlays.remove('question');
      case PlayState.gameOver:
      case PlayState.playing:
        overlays.remove('startBtn');
        overlays.add('inputBtn');
        overlays.add('question');
    }
  }

  @override
  FutureOr<void> onLoad() async {
    playState = PlayState.welcome;
    Floor topFloor = Floor(
        color: Colors.purpleAccent,
        position: Vector2(0, startHeight + playerHeight));
    Floor botFloor =
        Floor(color: Colors.deepOrangeAccent, position: Vector2(0, 0));
    player = PlayerForge2d(
      Sprite(
        await images.load('player.png'),
      ),
    );
    BackGround background = BackGround();
    await super.onLoad();
    await world.add(background);
    await world.add(topFloor);
    await world.add(botFloor);
    await world.add(player);
    camera.follow(player);
  }

  void gameStart() {
    playState = PlayState.playing;
    world.remove(world.children.elementAt(1));
  }
}
