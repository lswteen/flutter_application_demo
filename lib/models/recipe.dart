import 'dart:convert';
import 'package:http/http.dart' as http;

class Recipe {
  final String name;

  Recipe({required this.name});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
    );
  }

  static List<Recipe> getDummyRecipes() {
    return [
      Recipe(name: "Spaghetti Carbonara"),
      Recipe(name: "Chicken Curry"),
      Recipe(name: "Beef Stroganoff"),
      Recipe(name: "Vegetable Stir Fry"),
      Recipe(name: "Grilled Salmon"),
    ];
  }

  static Future<List<Recipe>> fetchRecipes() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:18082/recipes'));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        return body.map((dynamic item) => Recipe.fromJson(item)).toList();
      } else {
        return getDummyRecipes(); // API 실패 시 더미 데이터 반환
      }
    } catch (e) {
      return getDummyRecipes(); // 예외 발생 시 더미 데이터 반환
    }
  }
}