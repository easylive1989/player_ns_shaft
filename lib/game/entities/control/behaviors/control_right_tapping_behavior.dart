import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:player_ns_shaft/game/entities/control/control_right.dart';
import 'package:player_ns_shaft/game/game.dart';

class ControlRightTappingBehavior extends TappableBehavior<ControlRight>
    with HasGameRef<VeryGoodFlameGame> {
  @override
  bool onTapDown(TapDownInfo info) {
    gameRef.warriorBehavior = WarriorBehavior.goRight;
    return false;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    gameRef.warriorBehavior = WarriorBehavior.idle;
    return false;
  }
}
