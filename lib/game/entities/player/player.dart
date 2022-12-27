import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:player_ns_shaft/game/entities/terrace.dart';
import 'package:player_ns_shaft/game/game.dart';
import 'package:player_ns_shaft/gen/assets.gen.dart';

class Player extends PositionComponent
    with HasGameRef<VeryGoodFlameGame>, CollisionCallbacks {
  Player( {
    required super.position,
    required this.joystick,
  }) : super(size: Vector2(69, 44), anchor: Anchor.center) {
    add(RectangleHitbox(
      position: Vector2(16, 10),
      size: Vector2(20, 34),
    ));
  }

  final JoystickComponent joystick;
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
    if (joystick.direction == JoystickDirection.right) {
      position.x += joystick.relativeDelta[0];
      _animationGroupComponent!.current = WarriorBehavior.goRight;
    }
    if (joystick.direction == JoystickDirection.left) {
      position.x += joystick.relativeDelta[0];
      _animationGroupComponent!.current = WarriorBehavior.goLeft;
    }

    if(!joystick.isDragged) {
      _animationGroupComponent!.current = WarriorBehavior.idle;
    }

    final isGoLeft = _animationGroupComponent!.current == WarriorBehavior.goLeft;
    if (isGoLeft && !isFlippedHorizontally) {
      flipHorizontallyAroundCenter();
    }

    if (!isGoLeft && isFlippedHorizontally) {
      flipHorizontallyAroundCenter();
    }

    if (!isColliding) {
      position.y += 1;
    }

    if (position.y % 50 == 0) {
      gameRef.add(Terrace(position: Vector2.copy(position)..add(Vector2(0, 50))));
    }
  }
}
