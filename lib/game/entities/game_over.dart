import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player_ns_shaft/game/game.dart';

class GameOver extends HudMarginComponent<VeryGoodFlameGame> {
  GameOver({
    required EdgeInsets margin,
  }) : super(
          margin: margin,
          priority: 10,
          size: Vector2(100, 10),
        );

  @override
  void update(double dt) {
    if (gameRef.isGameOver && !hasChildren) {
      add(
        TextComponent(
          text: 'Game Over',
          anchor: Anchor.center,
          textRenderer: TextPaint(
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
      );
    }
  }
}
