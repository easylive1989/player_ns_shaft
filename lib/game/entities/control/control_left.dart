import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:player_ns_shaft/game/entities/control/behaviors/control_left_tapping_behavior.dart';
import 'package:player_ns_shaft/gen/assets.gen.dart';

class ControlLeft extends Entity with HasGameRef {
  ControlLeft({
    required super.position,
  }) : super(
          anchor: Anchor.center,
          size: Vector2(16, 34),
          behaviors: [
            ControlLeftTappingBehavior(),
          ],
        );

  Sprite? _sprite;

  @override
  Future<void> onLoad() async {
    _sprite = await gameRef.loadSprite(Assets.images.woodenControlLeft.path);

    await add(SpriteComponent(sprite: _sprite));
  }
}
