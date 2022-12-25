import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flame/game.dart';
import 'package:player_ns_shaft/game/entities/control/control_left.dart';
import 'package:player_ns_shaft/game/entities/control/control_right.dart';
import 'package:player_ns_shaft/game/entities/player/player.dart';
import 'package:player_ns_shaft/game/entities/terrace.dart';
import 'package:player_ns_shaft/l10n/l10n.dart';

enum WarriorBehavior {
  idle,
  goRight,
  goLeft,
}

class VeryGoodFlameGame extends FlameGame
    with HasTappables, HasCollisionDetection {
  VeryGoodFlameGame({
    required this.l10n,
    required this.effectPlayer,
  }) {
    debugMode = true;
    images.prefix = '';
  }

  final AppLocalizations l10n;

  final AudioPlayer effectPlayer;

  int counter = 0;

  WarriorBehavior warriorBehavior = WarriorBehavior.idle;


  @override
  Color backgroundColor() => const Color(0xFF2A48DF);

  @override
  Future<void> onLoad() async {
    camera.zoom = 4;
    await add(Player(position: Vector2(size.x / 2, 15)));
    await add(Terrace(position: Vector2(size.x / 2, 80)));
    await add(ControlLeft(position: Vector2(10, size.y - 10)));
    await add(ControlRight(position: Vector2(25, size.y - 10)));
  }
}
