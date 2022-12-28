import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:player_ns_shaft/game/entities/player/player.dart';
import 'package:player_ns_shaft/game/entities/terrace.dart';
import 'package:player_ns_shaft/game/entities/terrace_generator.dart';
import 'package:player_ns_shaft/l10n/l10n.dart';

enum WarriorBehavior {
  idle,
  goRight,
  goLeft,
}

class VeryGoodFlameGame extends FlameGame
    with HasTappables, HasCollisionDetection , HasDraggables{
  VeryGoodFlameGame({
    required this.l10n,
    required this.effectPlayer,
  }) {
    // debugMode = true;
    images.prefix = '';
  }

  final AppLocalizations l10n;

  final AudioPlayer effectPlayer;

  late Player player;

  @override
  Color backgroundColor() => const Color(0xFF2A48DF);

  @override
  Future<void> onLoad() async {
    camera.zoom = 4;
    final knobPaint = BasicPalette.black.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.lightBlue.withAlpha(100).paint();
    final joystick = JoystickComponent(
      knob: CircleComponent(radius: 10, paint: knobPaint),
      background: CircleComponent(radius: 50, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 30, bottom: 40),
    );

    await add(joystick);
    player = Player(position: Vector2(size.x / 2, 15), joystick: joystick);
    camera.followComponent(player);
    await add(player);
    await add(Terrace(position: Vector2(size.x / 2, 80)));
    await add(TerraceGenerator(player));
  }
}
