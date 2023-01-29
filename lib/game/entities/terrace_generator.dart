import 'dart:math';

import 'package:flame/components.dart';
import 'package:player_ns_shaft/game/entities/terrace.dart';
import 'package:player_ns_shaft/game/player_ns_shaft.dart';

class TerraceGenerator extends Component with HasGameRef<VeryGoodFlameGame> {
  TerraceGenerator() : super();

  @override
  Future<void> onLoad() async {
    await add(Terrace(position: Vector2(gameRef.size.x / 2, 140)));
    var currentLevel = 210.0;
    final cameraBottomY = gameRef.camera.position.y + gameRef.camera.gameSize.y;
    while(currentLevel <= cameraBottomY) {
      if ( currentLevel % 70 == 0) {
        _generateRandomTerrace(currentLevel);
      }
      currentLevel += 70;
    }
  }

  @override
  void update(double dt) {
    final cameraBottomY = gameRef.camera.position.y + gameRef.camera.gameSize.y;
    if ( cameraBottomY % 70 == 0) {
      _generateRandomTerrace(cameraBottomY);
    }
  }

  void _generateRandomTerrace(double cameraBottomY) {
    final random = Random();
    final unit = gameRef.size.x / 6;
    var currentGenerateSize = -unit;
    while (currentGenerateSize < gameRef.size.x + unit) {
      final nextInt = random.nextInt(gameRef.size.x.toInt()) + unit;
      currentGenerateSize += nextInt;
      add(
        Terrace(
          position: Vector2(currentGenerateSize, cameraBottomY + 10),
        ),
      );
      currentGenerateSize += 50;
    }
  }
}
