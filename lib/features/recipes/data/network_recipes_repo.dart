import 'package:dio/dio.dart';
import 'package:recipeapp/features/recipes/data/models/recipe.dart';
import 'package:recipeapp/features/recipes/data/repos/recipes_repo.dart';

import 'models/recipe_responce.dart';

class NetworkRecipesRepo implements RecipesRepo {
  final _dio = Dio(
      BaseOptions(baseUrl: 'https://tasty.p.rapidapi.com', queryParameters: {
    'from': '0',
    'size': '20',
    'tags': 'under_30_minutes'
  }, headers: {
    'X-RapidAPI-Key': '6a47072b79msh96c3a500819a09cp1d21c1jsn2ed71708b603',
    'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
  }));

  @override
  Future<List<Recipe>> getRecipeList({String query = ''}) async {
    final responce =
        await _dio.get('/recipes/list', queryParameters: {'q': query});
    final result = RecipesResponce.fromJson(responce.data).results;
    final recipes =
        result!.map((recipe) => Recipe.fromResponce(recipe)).toList();
    return recipes;
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
  Future<Recipe> getRecipe(String id) {
    // TODO: implement getRecipe
    throw UnimplementedError();
  }

  @override
  Future<void> removeRecipeFromFav(String recipeId) {
    // TODO: implement removeRecipeFromFav
    throw UnimplementedError();
  }
}
