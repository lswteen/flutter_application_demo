import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/counter.dart';
import 'models/food_provider.dart';

import 'ui/my_home_page.dart';
import 'ui/person_page.dart';
import 'ui/search_page.dart';
import 'ui/recipe_page.dart';
import 'ui/food_list_page.dart';
import 'ui/splash_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => FoodProvider()), // 음식 제공자 추가
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(), // 기본 페이지를 스플래시 화면으로 설정
      //home: const MyHomePage(title: 'Green Market'),
      routes: {
        '/home' : (context) => const MyHomePage(title: 'Green Market'),
        '/person': (context) => const PersonPage(),
        '/search': (context) => const SearchPage(),
        '/recipe': (context) => const RecipePage(),  
        '/recommendation': (context) => const FoodListPage(),
      },
    );
  }
}