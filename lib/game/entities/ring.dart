import 'package:flame/components.dart';
import 'package:player_ns_shaft/game/player_ns_shaft.dart';
import 'package:player_ns_shaft/gen/assets.gen.dart';

class Ring extends PositionComponent with HasGameRef<VeryGoodFlameGame> {
  Ring({
    required super.position,
  }) : super(size: Vector2(30, 30), anchor: Anchor.center);

  int removeLimit = 0;

  @override
  Future<void> onLoad() async {
    final sprite = await Sprite.load(Assets.images.ring.path);
    final spriteComponent = SpriteComponent(
      sprite: sprite,
      size: Vector2(30, 30),
      anchor: Anchor.center,
    );
    await add(spriteComponent);
  }

  @override
  void update(double dt) {
    final cameraVisibleBottom =
        gameRef.camera.position.y + gameRef.camera.gameSize.y / 2 + 50;
    if (position.y < cameraVisibleBottom) {
      removeLimit++;
      if (removeLimit == 200) {
        gameRef.remove(this);
      }
    }
  }
}
