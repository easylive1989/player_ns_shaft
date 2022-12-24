import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:player_ns_shaft/game/entities/control/behaviors/control_right_tapping_behavior.dart';
import 'package:player_ns_shaft/gen/assets.gen.dart';

class ControlRight extends Entity with HasGameRef {
  ControlRight({
    required super.position,
  }) : super(
    anchor: Anchor.center,
    size: Vector2(16, 34),
    behaviors: [
      ControlRightTappingBehavior(),
    ],
  );

  Sprite? _sprite;

  @override
  Future<void> onLoad() async {
    _sprite = await gameRef.loadSprite(Assets.images.woodenControlRight.path);

    await add(SpriteComponent(sprite: _sprite));
  }
}
