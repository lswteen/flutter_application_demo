import 'package:flutter/material.dart';

class AnimatedRecipeText extends StatelessWidget {
  final String recipe;
  final Animation<double> animation;

  const AnimatedRecipeText({
    Key? key,
    required this.recipe,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: 1 + animation.value * 0.1,
          child: Text(
            recipe,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}