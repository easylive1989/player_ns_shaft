import 'package:flame/components.dart';
import 'package:player_ns_shaft/game/game.dart';

class Hunter extends PositionComponent with HasGameRef<VeryGoodFlameGame> {
  Hunter({super.position}) : super();

  @override
  void update(double dt) {
    if (!gameRef.isGameOver) {
      position.y += 0.5;
    }
  }
}