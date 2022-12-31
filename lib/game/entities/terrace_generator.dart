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
    var currentGenerateSize = -50.0;
    if (player.position.y % 70 == 30 ) {
      while (currentGenerateSize < gameRef.size.x + 50) {
        final nextInt = random.nextInt(250) + 50;
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
