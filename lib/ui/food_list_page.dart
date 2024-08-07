import 'dart:async';
import 'dart:math';

import 'package:provider/provider.dart';
import '../models/food_provider.dart';
import '../models/food.dart';

import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_app_bar.dart';
import '../widgets/custom_drawer.dart';  // CustomDrawer import 추가


class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  int _selectedIndex = -1;
  final Random _random = Random();
  List<Food> _foods = [];
  bool _isAnimating = false;
  Timer? _timer;

  void _startRandomSelection() {
    setState(() {
      _isAnimating = true;
    });

    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        _selectedIndex = _random.nextInt(_foods.length);
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      _timer?.cancel();
      setState(() {
        _isAnimating = false;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<FoodProvider>(context);
    _foods = foodProvider.foods;

    return Scaffold(
      appBar: const CustomAppBar(title: 'random menu'),
      drawer: const CustomDrawer(),  // 32번 줄: CustomDrawer 추가
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        itemCount: _foods.length,
        itemBuilder: (context, index) {
          final food = _foods[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Card(
              // shape: RoundedRectangleBorder(
              //   side: BorderSide(
              //     color: _selectedIndex == index ? Colors.red : Colors.transparent,
              //     width: 2,
              //   ),
              //   borderRadius: BorderRadius.circular(4.0),
              // ),
              child: Container(
                color: _isAnimating && _selectedIndex == index
                    ? Colors.purple.withOpacity(0.5)
                    : _selectedIndex == index
                        ? Colors.deepPurple.withOpacity(0.5)
                        : Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(food.imageUrl, height: 80, fit: BoxFit.cover),
                    Text(food.title),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startRandomSelection,
        tooltip: 'Random Food',
        child: const Icon(Icons.shuffle),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}