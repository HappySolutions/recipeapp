import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipeapp/features/recipes/data/network_recipes_repo.dart';
import 'package:recipeapp/features/recipes/data/repos/recipes_repo.dart';
import 'package:recipeapp/views/home.dart';

import 'features/recipes/data/local_json_recipes_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final recipesRepo = InMemoryRecipesRepo();
  // final recipesJson = json.decode(
  //   await rootBundle.loadString('assets/data/recipes.json'),
  // );

  // final localJsonRecipesRepo = LocalJsonRecipesRepo(recipesJson);

  final networkRecipesRepo = NetworkRecipesRepo();
  runApp(MyApp(
      // recipesRepo: recipesRepo,
      // recipesRepo: localJsonRecipesRepo
      recipesRepo: networkRecipesRepo));
}

class MyApp extends StatelessWidget {
  final RecipesRepo recipesRepo;
  const MyApp({super.key, required this.recipesRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: HomePage(recipesRepo: recipesRepo),
    );
  }
}
