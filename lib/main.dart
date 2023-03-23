import 'package:flutter/material.dart';
import 'package:recipeapp/features/recipes/data/repos/network_recipes_repo.dart';
import 'package:recipeapp/features/recipes/data/repos/recipes_repo.dart';
import 'package:recipeapp/features/recipes/presentation/screens/home.dart';

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
