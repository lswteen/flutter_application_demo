import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodDetailPage extends StatelessWidget {
  final Food food;

  const FoodDetailPage({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(food.imageUrl),
            const SizedBox(height: 16),
            Text('Recipe:', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(food.recipe),
          ],
        ),
      ),
    );
  }
}