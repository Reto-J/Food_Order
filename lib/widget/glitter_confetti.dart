import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class GlitterConfetti extends StatelessWidget {
  final ConfettiController controller;
  final List<Color> colors;
  const GlitterConfetti({
    super.key,
    required this.controller,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: controller,
      blastDirection: -pi /2,
      emissionFrequency: 0.6,
      numberOfParticles: 6,
      gravity: 0.3,
      colors: colors,
      );
  }
}
