import 'package:recipeapp/features/recipes/data/models/recipe.dart';
import 'package:recipeapp/features/recipes/data/repos/recipes_repo.dart';

import '../models/recipe_responce.dart';

class InMemoryRecipesRepo implements RecipesRepo {
  final List<Recipe> _recipes = [
    Recipe(
        id: 1,
        name: "Cheesy Broccoli Stuffed Chicken (low-carb, Keto)",
        thumbnailUrl:
            'https://lh3.googleusercontent.com/JM8pq6tZMu4B74G3Gk1FMNh-9rVRgXJaenBTNpZ7icvnPACg-UFaR807kJEdx4TRuLVFOsNmeoniz-4VvrU4MXQ=s360',
        cookTimeMinutes: 4,
        description: '40 min'),
    Recipe(
        id: 2,
        name: "Instant Pot Pork Chops",
        thumbnailUrl:
            "https://lh3.googleusercontent.com/Pftjh5VlatihgjOaf7BXfV9_ijji5sEFH3hC0H0bmCYyzh7YnWNwshxbw8DCkjIkqTJxmsktzoD8GAoH98AwpME=s360",
        cookTimeMinutes: 5,
        description: '30 min'),
    Recipe(
        id: 3,
        name: "Air Fryer Lemon Pepper Chicken Thighs",
        thumbnailUrl:
            "https://lh3.googleusercontent.com/OaoSADoGANokmtd1mMA81ddxVEBwC_cTJE9SWwDwoYL7geFzwnB9jxQrwbHo_VozAyqb9sLwOH3sVtNgx3X5309P5BW-cifbaDhH=s360",
        cookTimeMinutes: 5,
        description: '20 min'),
    Recipe(
        id: 3,
        name: "Gluten Free Apple Crisp",
        thumbnailUrl:
            'https://lh3.googleusercontent.com/d2TJZAKwuXKq4DQHDH27ml9519ENDrU8foZihMvmbDFcAvvyHKErS0--aqW73l3OMLVUqvxX3gOTzri15dV3AQ=s360',
        cookTimeMinutes: 3,
        description: '50 min'),
    Recipe(
        id: 4,
        name: "Jalapeno Popper Chicken Soup",
        thumbnailUrl:
            'https://lh3.googleusercontent.com/F4IEzcZIq5Z_Y5dqrtEC9Op-eAlkRSRqphlzOMi1Tkxxm_-HPHQneC56o_wv3cECRLwevsGw-kN42mzUZGe7Ww=s360',
        cookTimeMinutes: 4,
        description: '60 min'),
    Recipe(
        id: 5,
        name: "Kielbasa with Sauerkraut and Potatoes",
        thumbnailUrl:
            'https://lh3.googleusercontent.com/S5jTMEbrI_ySZyVKxzMznA7FKM4OF3PKoOB7O2gViqFdQXzL2AejyzeqIosKlwAv_1WHZtmPYPuUPYb2v0BCI_U=s360',
        cookTimeMinutes: 4,
        description: '20 min'),
  ];

  @override
  Future<List<Recipe>> getRecipeList({String query = ''}) async {
    return _recipes;
  }

  @override
  Future<Recipe> getRecipe(String name) async {
    return _recipes.firstWhere((recipe) => recipe.name == name);
  }

  @override
  Future<void> addRecipeToFav(Recipe recipe) {
    // TODO: implement addRecipeToFav
    throw UnimplementedError();
  }

  @override
  Future<List<Recipe>> getFavRecipeList() {
    // TODO: implement getFavRecipeList
    throw UnimplementedError();
  }

  @override
  Future<void> removeRecipeFromFav(String recipeId) {
    // TODO: implement removeRecipeFromFav
    throw UnimplementedError();
  }
}
