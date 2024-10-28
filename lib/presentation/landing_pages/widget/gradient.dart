import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    required this.style,
  });
  

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style.copyWith(
          color: Colors.white,
           shadows: [
            Shadow(
              offset: const Offset(2, 2),
              blurRadius: 4.0,
              color: Colors.black.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }
}