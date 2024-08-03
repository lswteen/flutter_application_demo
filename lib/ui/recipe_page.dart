import 'dart:math';
import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_app_bar.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> with SingleTickerProviderStateMixin {
  final List<String> recipes = [
    "Spaghetti Carbonara",
    "Chicken Curry",
    "Beef Stroganoff",
    "Vegetable Stir Fry",
    "Grilled Salmon",
  ];
  String selectedRecipe = "Press the button to get a recipe";
  late AnimationController _controller;
  late Animation<double> _animation;
  Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _getRandomRecipe() {
    _controller.forward().then((_) {
      setState(() {
        selectedRecipe = recipes[_random.nextInt(recipes.length)];
      });
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Random Recipe Selector'),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1 + _animation.value * 0.1,
                  child: Text(
                    selectedRecipe,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: _getRandomRecipe,
              child: Text('Get Random Recipe'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}