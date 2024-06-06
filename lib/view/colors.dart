import 'dart:math' as math;
import 'package:flutter/material.dart';

class GradientTextPainter extends CustomPainter {
  final double animationValue;

  GradientTextPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: '1.1.1.1',
        style: TextStyle(
          fontSize: 70.0,
          fontWeight: FontWeight.bold,
          foreground: Paint()..shader = _createShader(size, animationValue),
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, const Offset(0, 0));
  }

  Shader _createShader(Size size, double animationValue) {
    double waveFrequency = 2 * math.pi; // frequency of the wave
    double waveAmplitude = 20.0; // amplitude of the wave

    final stops = List.generate(27, (index) => (animationValue + index * (1 / 27)).clamp(0.0, 1.0));

    return LinearGradient(
      colors: const [
        Colors.orange,
        Colors.blue,
        Color.fromARGB(255, 35, 68, 84),
        Colors.pink,
        Colors.yellow,
        Colors.yellowAccent,
        Colors.orangeAccent,
        Colors.lightBlue,
        Colors.lightBlue,
        Colors.orange,
        Colors.blue,
        Color.fromARGB(255, 35, 68, 84),
        Colors.pink,
        Colors.yellow,
        Colors.yellowAccent,
        Colors.orangeAccent,
        Colors.lightBlue,
        Colors.lightBlue,
        Colors.orange,
        Colors.blue,
        Color.fromARGB(255, 35, 68, 84),
        Colors.pink,
        Colors.yellow,
        Colors.yellowAccent,
        Colors.orangeAccent,
        Colors.lightBlue,
        Colors.lightBlue,
      ],
      stops: stops,
      tileMode: TileMode.mirror,
      transform: GradientRotation(waveFrequency * animationValue),
    ).createShader(Rect.fromLTWH(
      -size.width * animationValue, // Move the gradient from right to left
      waveAmplitude * math.sin(waveFrequency * animationValue),
      size.width * 2, // Ensure gradient covers entire text
      size.height * 2,
    ));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
