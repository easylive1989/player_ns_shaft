import 'package:audioplayers/audioplayers.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:player_ns_shaft/game/entities/game_over.dart';
import 'package:player_ns_shaft/game/entities/hunter.dart';
import 'package:player_ns_shaft/game/entities/player/player.dart';
import 'package:player_ns_shaft/game/entities/score.dart';
import 'package:player_ns_shaft/game/entities/terrace_generator.dart';
import 'package:player_ns_shaft/game/entities/world.dart';
import 'package:player_ns_shaft/l10n/l10n.dart';

class VeryGoodFlameGame extends FlameGame
    with HasTappables, HasCollisionDetection, HasDraggables {
  VeryGoodFlameGame({
    required this.l10n,
    required this.effectPlayer,
  }) {
    images.prefix = '';
  }

  final AppLocalizations l10n;

  final AudioPlayer effectPlayer;

  late Player player;

  bool get isGameOver {
    const overLimit = 50;
    final playerTopY = player.position.y;
    final cameraTopY = camera.position.y;
    final isOverTopLimit = cameraTopY - overLimit > playerTopY;
    final cameraBottomY = cameraTopY + camera.gameSize.y;
    final isOverBottomLimit = cameraBottomY + overLimit < playerTopY;
    return isOverTopLimit || isOverBottomLimit;
  }

  @override
  Future<void> onLoad() async {
    camera.zoom = 3;
    final knobPaint = BasicPalette.black.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.lightBlue.withAlpha(100).paint();
    final joystick = JoystickComponent(
      knob: CircleComponent(radius: 10, paint: knobPaint),
      background: CircleComponent(radius: 50, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 30, bottom: 40),
      priority: 10,
    );

    add(World());
    await add(joystick);
    player = Player(position: Vector2(size.x / 2, 15), joystick: joystick);
    final hunter = Hunter(position: Vector2(0, 0));
    await add(hunter);
    camera.followComponent(
      hunter,
      worldBounds: Rect.fromLTWH(0, 0, size.x, double.infinity),
    );

    await add(player);
    await add(TerraceGenerator());
    await add(
      GameOver(
        margin: EdgeInsets.only(top: 100, left: size.x / 2),
        position: size / 2,
      ),
    );
    await add(
      Score(
        margin: const EdgeInsets.only(top: 30, right: 60),
        player: player,
      ),
    );
  }
}
