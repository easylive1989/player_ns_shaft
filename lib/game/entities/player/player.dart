import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:player_ns_shaft/game/entities/terrace.dart';
import 'package:player_ns_shaft/game/player_ns_shaft.dart';
import 'package:player_ns_shaft/gen/assets.gen.dart';

enum WarriorBehavior {
  idleLeft,
  goLeft,
  idleRight,
  goRight,
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
  final _playerAnimationData = SpriteAnimationData.sequenced(
    amount: 10,
    stepTime: 0.1,
    textureSize: Vector2(120, 80),
  );
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

    print(isCollidingVertically);
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
    _animationGroupComponent = SpriteAnimationGroupComponent<WarriorBehavior>(
      animations: {
        WarriorBehavior.idleLeft: await gameRef.loadSpriteAnimation(
          Assets.images.knightLeftIdle.path,
          _playerAnimationData,
        ),
        WarriorBehavior.goLeft: await gameRef.loadSpriteAnimation(
          Assets.images.knightLeftRun.path,
          _playerAnimationData,
        ),
        WarriorBehavior.idleRight: await gameRef.loadSpriteAnimation(
          Assets.images.knightRightIdle.path,
          _playerAnimationData,
        ),
        WarriorBehavior.goRight: await gameRef.loadSpriteAnimation(
          Assets.images.knightRightRun.path,
          _playerAnimationData,
        ),
      },
      current: WarriorBehavior.idleRight,
      size: size,
    );
    await add(_animationGroupComponent);
  }

  @override
  void update(double dt) {
    if (canGoY) {
      if (joystick.direction == JoystickDirection.left) {
        _animationGroupComponent.current = WarriorBehavior.idleLeft;
      }
      if (joystick.direction == JoystickDirection.right) {
        _animationGroupComponent.current = WarriorBehavior.idleRight;
      }
      position.y += 1;
      return;
    }

    if (!joystick.isDragged) {
      if (joystick.direction == JoystickDirection.left) {
        _animationGroupComponent.current = WarriorBehavior.idleLeft;
      }
      if (joystick.direction == JoystickDirection.right) {
        _animationGroupComponent.current = WarriorBehavior.idleRight;
      }
    }

    if (joystick.direction == JoystickDirection.right) {
      position.x += joystick.relativeDelta[0];
      _animationGroupComponent.current = WarriorBehavior.goRight;
    }

    if (joystick.direction == JoystickDirection.left) {
      position.x += joystick.relativeDelta[0];
      _animationGroupComponent.current = WarriorBehavior.goLeft;
    }
  }
}
