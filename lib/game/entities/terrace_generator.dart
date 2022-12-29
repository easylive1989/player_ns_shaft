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
    double currentGenerateSize = -50;
    if (player.position.y % 70 == 30 && player.position.y > 100) {
      while (currentGenerateSize < gameRef.size.x + 100) {
        final nextInt = random.nextInt(150);
        currentGenerateSize += nextInt;
        gameRef.add(
          Terrace(position: Vector2(currentGenerateSize, player.position.y + 200)),
        );
        currentGenerateSize += 50;
      }
    }
  }
}
