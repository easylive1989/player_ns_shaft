import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:player_ns_shaft/game/game.dart';
import 'package:player_ns_shaft/gen/assets.gen.dart';

class Player extends Entity with HasGameRef<VeryGoodFlameGame> {
  Player({
    required super.position,
  }) : super(
          anchor: Anchor.center,
          size: Vector2(69, 44),
          behaviors: [],
        );

  SpriteAnimationGroupComponent? _animationGroupComponent;

  @override
  Future<void> onLoad() async {
    final idleAnimation = await _getIdleAnimation();
    final rightAnimation = await _getRightRunningAnimation();
    final leftAnimation = await _getLeftRunningAnimation();

    _animationGroupComponent = SpriteAnimationGroupComponent<WarriorBehavior>(
      animations: {
        WarriorBehavior.idle: idleAnimation,
        WarriorBehavior.goRight: rightAnimation,
        WarriorBehavior.goLeft: leftAnimation,
      },
      current: WarriorBehavior.idle,
      size: size,
    );
    await add(_animationGroupComponent!);
  }

  Future<SpriteAnimation> _getIdleAnimation() {
    return gameRef.loadSpriteAnimation(
      Assets.images.warriorAnimation.path,
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: 0.1,
        amountPerRow: 6,
        textureSize: Vector2(69, 44),
      ),
    );
  }

  Future<SpriteAnimation> _getRightRunningAnimation() {
    return gameRef.loadSpriteAnimation(
      Assets.images.warriorAnimation.path,
      SpriteAnimationData.range(
        start: 6,
        end: 13,
        amount: 99,
        stepTimes: List.generate(8, (index) => 0.1),
        amountPerRow: 6,
        textureSize: Vector2(69, 44),
      ),
    );
  }

  Future<SpriteAnimation> _getLeftRunningAnimation() {
    return gameRef.loadSpriteAnimation(
      Assets.images.warriorAnimation.path,
      SpriteAnimationData.range(
        start: 6,
        end: 13,
        amount: 99,
        stepTimes: List.generate(8, (index) => 0.1),
        amountPerRow: 6,
        textureSize: Vector2(69, 44),
      ),
    );
  }

  @override
  void update(double dt) {
    bool isGoLeft = gameRef.warriorBehavior == WarriorBehavior.goLeft;
    if (isGoLeft && !_animationGroupComponent!.isFlippedHorizontally) {
      _animationGroupComponent!.flipHorizontallyAroundCenter();
      _animationGroupComponent!.position..sub(Vector2(18, 0));
    }

    if (!isGoLeft && _animationGroupComponent!.isFlippedHorizontally) {
      _animationGroupComponent!.flipHorizontallyAroundCenter();
      _animationGroupComponent!.position..add(Vector2(18, 0));
    }

    _animationGroupComponent!.current = gameRef.warriorBehavior;
  }
}
