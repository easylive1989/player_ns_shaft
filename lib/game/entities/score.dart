import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player_ns_shaft/game/entities/player/player.dart';
import 'package:player_ns_shaft/game/player_ns_shaft.dart';

class Score extends HudMarginComponent<VeryGoodFlameGame> {
  Score({
    required EdgeInsets margin,
    required this.player,
  }) : super(
          margin: margin,
          priority: 10,
          size: Vector2(30, 10),
        );

  late final TextComponent text;
  final Player player;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await add(
      text = TextComponent(
        anchor: Anchor.center,
        textRenderer: TextPaint(
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    text.text = gameRef.l10n.scoreText(player.position.y.toInt());
  }
}
