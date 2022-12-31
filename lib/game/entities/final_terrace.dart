import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:player_ns_shaft/game/game.dart';

class FinalTerrace extends PositionComponent
    with HasGameRef<VeryGoodFlameGame> {
  FinalTerrace({required super.position, super.size}) : super() {
    add(RectangleHitbox());
  }

  @override
  Future<void> onLoad() async {
    await add(RectangleComponent(size: size));
  }
}
