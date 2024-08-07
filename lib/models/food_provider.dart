import 'dart:math';
import 'package:flutter/material.dart';
import 'food.dart';

class FoodProvider with ChangeNotifier {
  List<Food> _foods = [
    Food(
      title: 'Pizza1',
      imageUrl: 'https://via.placeholder.com/150',
      recipe: '1. Dough\n2. Sauce\n3. Cheese\n4. Bake',
    ),
    Food(
      title: 'Burger2',
      imageUrl: 'https://via.placeholder.com/150',
      recipe: '1. Bun\n2. Patty\n3. Lettuce\n4. Tomato\n5. Sauce',
    ),
    // 추가적인 음식 항목들
    Food(
      title: 'Sushi3',
      imageUrl: 'https://via.placeholder.com/150',
      recipe: '1. Rice\n2. Fish\n3. Seaweed',
    ),
    Food(
      title: 'Pasta4',
      imageUrl: 'https://via.placeholder.com/150',
      recipe: '1. Noodles\n2. Sauce\n3. Cheese',
    ),
    Food(
      title: 'Pasta5',
      imageUrl: 'https://via.placeholder.com/150',
      recipe: '1. Noodles\n2. Sauce\n3. Cheese',
    ),
    Food(
      title: 'Pasta6',
      imageUrl: 'https://via.placeholder.com/150',
      recipe: '1. Noodles\n2. Sauce\n3. Cheese',
    ),
    Food(
      title: 'Pasta7',
      imageUrl: 'https://via.placeholder.com/150',
      recipe: '1. Noodles\n2. Sauce\n3. Cheese',
    ),
    Food(
      title: 'Pasta8',
      imageUrl: 'https://via.placeholder.com/150',
      recipe: '1. Noodles\n2. Sauce\n3. Cheese',
    ),
    Food(
      title: 'Pasta9',
      imageUrl: 'https://via.placeholder.com/150',
      recipe: '1. Noodles\n2. Sauce\n3. Cheese',
    ),
    Food(
      title: 'Pasta10',
      imageUrl: 'https://via.placeholder.com/150',
      recipe: '1. Noodles\n2. Sauce\n3. Cheese',
    ),
    Food(
      title: 'Pasta11',
      imageUrl: 'https://via.placeholder.com/150',
      recipe: '1. Noodles\n2. Sauce\n3. Cheese',
    ),
    Food(
      title: 'Pasta12',
      imageUrl: 'https://via.placeholder.com/150',
      recipe: '1. Noodles\n2. Sauce\n3. Cheese',
    ),
  ];

  List<Food> get foods => _foods;

  Food getRandomFood() {
    final random = Random();
    return _foods[random.nextInt(_foods.length)];
  }
}