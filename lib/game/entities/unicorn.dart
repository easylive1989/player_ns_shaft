import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:player_ns_shaft/gen/assets.gen.dart';

class Unicorn extends Entity with HasGameRef {
  Unicorn({
    required super.position,
  }) : super(size: Vector2.all(32), anchor: Anchor.center);

  @visibleForTesting
  Unicorn.test({
    required super.position,
    super.behaviors,
  }) : super(size: Vector2.all(32));

  SpriteAnimation? _animation;
  int removeLimit = 0;

  @visibleForTesting
  SpriteAnimation get animation => _animation!;

  @override
  Future<void> onLoad() async {
    _animation = await gameRef.loadSpriteAnimation(
      Assets.images.unicornAnimation.path,
      SpriteAnimationData.sequenced(
        amount: 16,
        stepTime: 0.1,
        textureSize: Vector2.all(32),
        loop: false,
      ),
    );

    await add(SpriteAnimationComponent(animation: _animation, size: size));
  }

  @override
  void update(double dt) {
    final cameraVisibleBottom =
        gameRef.camera.position.y + gameRef.camera.gameSize.y / 2 + 32;
    if (position.y < cameraVisibleBottom) {
      removeLimit++;
      if (removeLimit == 200) {
        gameRef.remove(this);
      }
    }
  }
}
