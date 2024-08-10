import 'dart:math';
import 'package:flutter/material.dart';

//공통영역
import '../widgets/custom_drawer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_app_bar.dart';

// 관련 정보
import '../models/recipe.dart';
import '../widgets/animated_recipe_text.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> with SingleTickerProviderStateMixin {
  List<Recipe> _recipes = [];
  String selectedRecipe = "Press the button to get a recipe";
  late AnimationController _controller;
  late Animation<double> _animation;
  Random _random = Random();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _fetchRecipes();
  }

  Future<void> _fetchRecipes() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _recipes = await Recipe.fetchRecipes();
    } catch (e) {
      _recipes = Recipe.getDummyRecipes();  // 예외 처리 시 더미 데이터를 사용
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _getRandomRecipe() {
    if (_recipes.isEmpty) {
      setState(() {
        selectedRecipe = "No recipes available";
      });
      return;
    }

    _controller.forward().then((_) {
      setState(() {
        selectedRecipe = _recipes[_random.nextInt(_recipes.length)].name;
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
        child: _isLoading
            ? CircularProgressIndicator() // 데이터 로딩 중일 때 표시
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedRecipeText(recipe: selectedRecipe, animation: _animation),
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