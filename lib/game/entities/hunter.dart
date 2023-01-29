import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:player_ns_shaft/game/entities/player/player.dart';
import 'package:player_ns_shaft/game/player_ns_shaft.dart';

class Hunter extends PositionComponent
    with HasGameRef<VeryGoodFlameGame>, CollisionCallbacks {
  Hunter({
    required double cameraHeight,
    super.position,
  }) {
    add(
      RectangleHitbox(
        position: Vector2(0, 0 - cameraHeight / 2 - 50),
        size: Vector2(3000, 1),
      ),
    );
    add(
      RectangleHitbox(
        position: Vector2(0, cameraHeight / 2 + 50),
        size: Vector2(3000, 1),
      ),
    );
  }

  double delay = 0;

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Player) {
      gameRef.gameOver();
    }
  }

  @override
  void update(double dt) {
    if (delay < 5) {
      delay += dt;
      return;
    }
    position.y += 0.5;
  }
}
