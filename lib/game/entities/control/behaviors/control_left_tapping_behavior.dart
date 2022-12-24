import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:player_ns_shaft/game/entities/control/control_left.dart';
import 'package:player_ns_shaft/game/game.dart';

class ControlLeftTappingBehavior extends TappableBehavior<ControlLeft>
    with HasGameRef<VeryGoodFlameGame> {
  @override
  bool onTapDown(TapDownInfo info) {
    gameRef.warriorBehavior = WarriorBehavior.goLeft;

    return false;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    gameRef.warriorBehavior = WarriorBehavior.idle;
    return false;
  }
}
