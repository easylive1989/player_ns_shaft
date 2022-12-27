import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Terrace extends PositionComponent {
  Terrace({required super.position})
      : super(
          size: Vector2(50, 10),
          anchor: Anchor.center,
        ) {
    add(RectangleHitbox());
  }

  @override
  Future<void> onLoad() async {
    await add(RectangleComponent(size: Vector2(50, 10)));
  }

}
