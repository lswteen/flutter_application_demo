import 'package:flutter/material.dart';
import 'dart:math';

class RouletteWheelPage extends StatefulWidget {
  @override
  _RouletteWheelPageState createState() => _RouletteWheelPageState();
}

class _RouletteWheelPageState extends State<RouletteWheelPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isSpinning = false;
  String selectedRecipeTitle = '';

  final List<String> recipes = [
    'Pizza',
    'Salad',
    'Steak',
    'Cupcake',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isSpinning = false;
          _updateSelectedRecipe();
        });
      }
    });

    _startSpin();
  }

  void _startSpin() {
    setState(() {
      isSpinning = true;
    });

    final random = Random();
    final end = 360.0 * 6 + random.nextInt(360);

    _animation = Tween<double>(begin: 0, end: end).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.reset();
    _controller.forward();
  }

  void _updateSelectedRecipe() {
    final random = Random();
    final index = random.nextInt(recipes.length);
    selectedRecipeTitle = recipes[index];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roulette Wheel'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (selectedRecipeTitle.isNotEmpty) // 선택된 레시피 타이틀이 있을 때만 표시
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                selectedRecipeTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          GestureDetector(
            onTap: isSpinning ? null : _startSpin,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animation.value * pi / 180,
                  child: child,
                );
              },
              child: Image.asset('assets/images/roulette_wheel.png'),
            ),
          ),
        ],
      ),
    );
  }
}