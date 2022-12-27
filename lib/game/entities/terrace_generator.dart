import 'package:flame/components.dart';
import 'package:player_ns_shaft/game/entities/terrace.dart';
import 'package:player_ns_shaft/game/game.dart';

class TerraceGenerator extends Component with HasGameRef<VeryGoodFlameGame> {
  TerraceGenerator(this.player) : super();

  final Player player;

  @override
  void update(double dt) {
    if (player.position.y % 70 == 30 && player.position.y > 100) {
      gameRef.add(Terrace(position: Vector2.copy(player.position)..add(Vector2(0, 50))));
    }
  }
}
