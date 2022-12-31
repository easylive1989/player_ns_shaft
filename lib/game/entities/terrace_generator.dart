import 'dart:math';

import 'package:flame/components.dart';
import 'package:player_ns_shaft/game/entities/terrace.dart';
import 'package:player_ns_shaft/game/game.dart';

class TerraceGenerator extends Component with HasGameRef<VeryGoodFlameGame> {
  TerraceGenerator(this.player) : super();

  final Player player;

  @override
  void update(double dt) {
    final random = Random();
    final unit = gameRef.size.x / 6;
    var currentGenerateSize = -unit;
    if (player.position.y % 70 == 30 ) {
      while (currentGenerateSize < gameRef.size.x + unit) {
        final nextInt = random.nextInt(gameRef.size.x.toInt()) + unit;
        currentGenerateSize += nextInt;
        gameRef.add(
          Terrace(
            position: Vector2(currentGenerateSize, player.position.y + 200),
          ),
        );
        currentGenerateSize += 50;
      }
    }
  }
}
