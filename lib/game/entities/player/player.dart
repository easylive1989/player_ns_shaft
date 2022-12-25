import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:player_ns_shaft/game/game.dart';
import 'package:player_ns_shaft/gen/assets.gen.dart';

class Player extends PositionComponent
    with HasGameRef<VeryGoodFlameGame>, CollisionCallbacks {
  Player({
    required super.position,
  }) : super(size: Vector2(69, 44), anchor: Anchor.center) {
    add(RectangleHitbox(
      position: Vector2(16, 10),
      size: Vector2(20, 34),
    ));
  }

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
    final isGoLeft = gameRef.warriorBehavior == WarriorBehavior.goLeft;
    if (isGoLeft && !isFlippedHorizontally) {
      flipHorizontallyAroundCenter();
      position.x -= 18;
    }

    if (!isGoLeft && isFlippedHorizontally) {
      flipHorizontallyAroundCenter();
      position.x += 18;
    }

    if (gameRef.warriorBehavior == WarriorBehavior.goRight) {
      position.x += 1;
    }
    if (gameRef.warriorBehavior == WarriorBehavior.goLeft) {
      position.x -= 1;
    }

    _animationGroupComponent!.current = gameRef.warriorBehavior;
    if (!isColliding) {
      position.y += 0.5;
    }
  }
}
