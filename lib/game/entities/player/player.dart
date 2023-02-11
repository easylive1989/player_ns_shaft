import 'package:collection/collection.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:player_ns_shaft/game/entities/terrace.dart';
import 'package:player_ns_shaft/game/player_ns_shaft.dart';
import 'package:player_ns_shaft/gen/assets.gen.dart';

enum WarriorBehavior {
  idle,
  goRight,
  goLeft,
}

class Player extends PositionComponent
    with HasGameRef<VeryGoodFlameGame>, CollisionCallbacks {
  Player({
    required super.position,
    required this.joystick,
  }) : super(size: Vector2(120, 80), anchor: Anchor.center) {
    add(
      RectangleHitbox(
        anchor: Anchor.center,
        size: Vector2(22, 40),
        position: Vector2(55, 60),
      ),
    );
  }

  final JoystickComponent joystick;
  late SpriteAnimationGroupComponent<WarriorBehavior> _animationGroupComponent;
  bool canGoRight = true;
  bool canGoLeft = true;
  bool canGoY = true;

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is! Terrace) {
      return;
    }

    final isCollidingVertically =
        (intersectionPoints.first.y - intersectionPoints.last.y).abs() < 5;

    if (isCollidingVertically) {
      canGoY = false;
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    canGoLeft = true;
    canGoRight = true;
    canGoY = true;
  }

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
    await add(_animationGroupComponent);
  }

  Future<SpriteAnimation> _getIdleAnimation() {
    return gameRef.loadSpriteAnimation(
      Assets.images.knightIdle.path,
      SpriteAnimationData.sequenced(
        amount: 10,
        stepTime: 0.1,
        textureSize: Vector2(120, 80),
      ),
    );
  }

  Future<SpriteAnimation> _getRightRunningAnimation() {
    return gameRef.loadSpriteAnimation(
      Assets.images.knightRun.path,
      SpriteAnimationData.sequenced(
        amount: 10,
        stepTime: 0.1,
        textureSize: Vector2(120, 80),
      ),
    );
  }

  Future<SpriteAnimation> _getLeftRunningAnimation() {
    return gameRef.loadSpriteAnimation(
      Assets.images.knightRun.path,
      SpriteAnimationData.sequenced(
        amount: 10,
        stepTime: 0.1,
        textureSize: Vector2(120, 80),
      ),
    );
  }

  @override
  void update(double dt) {
    if (canGoY) {
      _animationGroupComponent.current = WarriorBehavior.idle;
      position.y += 1;
      return;
    }

    if (joystick.direction == JoystickDirection.right &&
        canGoRight &&
        position.x <= gameRef.size.x) {
      position.x += joystick.relativeDelta[0];
      _animationGroupComponent.current = WarriorBehavior.goRight;
    }
    if (joystick.direction == JoystickDirection.left &&
        canGoLeft &&
        position.x >= 0) {
      position.x += joystick.relativeDelta[0];
      _animationGroupComponent.current = WarriorBehavior.goLeft;
    }

    final isGoLeft = _animationGroupComponent.current == WarriorBehavior.goLeft;
    if (isGoLeft && !isFlippedHorizontally) {
      flipHorizontallyAroundCenter();
    }

    if (!isGoLeft && isFlippedHorizontally) {
      flipHorizontallyAroundCenter();
    }

    if (!joystick.isDragged) {
      _animationGroupComponent.current = WarriorBehavior.idle;
    }
  }
}
