import 'package:audioplayers/audioplayers.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:player_ns_shaft/game/game.dart';
import 'package:player_ns_shaft/game/player_ns_shaft.dart';
import 'package:player_ns_shaft/gen/assets.gen.dart';

class TappingBehavior extends TappableBehavior<Player>
    with HasGameRef<VeryGoodFlameGame> {
  @override
  bool onTapDown(TapDownInfo info) {
    gameRef.counter++;

    gameRef.effectPlayer.play(AssetSource(Assets.audio.effect));

    return false;
  }
}
