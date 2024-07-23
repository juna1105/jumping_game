import 'package:flame/components.dart';

enum ButtonType { tl, tr, br, bl }

enum ReactType { good, bad, jump }

const gameWidth = 1440.0;
const gameHeight = 6000.0;
const startHeight = -2000.0;
const playerWidth = 100.0;
const playerHeight = 200.0;
Vector2 floorSize = Vector2(gameWidth, gameHeight / 40);
Vector2 btnSize = Vector2(300, 300);
