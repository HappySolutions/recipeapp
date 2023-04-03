import 'package:http/http.dart' as http;
import 'package:recipeapp/features/recipes/data/repos/recipes_repo.dart';
import 'dart:convert';

import '../models/recipe.dart';
import '../models/recipe_responce.dart';

class LocalJsonRecipesRepo implements RecipesRepo {
  final Map<String, dynamic> _json;
  LocalJsonRecipesRepo(this._json);

  @override
  Future<List<Recipe>> getRecipeList({String query = ''}) async {
    final items = RecipesResponce.fromJson(_json);
    final recipes =
        items.results?.map((recipe) => Recipe.fromResponce(recipe)).toList();
    return recipes!;
  }

  @override
  Future<Recipe> getRecipe(String id) async {
    final items = RecipesResponce.fromJson(_json);
    final recipes =
        items.results?.map((recipe) => Recipe.fromResponce(recipe)).toList();
    final recipe = recipes!.firstWhere((recipe) => recipe.id == id);
    return recipe;
  }

  // @override
  // Future<List<Recipe>> getRecipeList({String query = ''}) async {
  //   final _temp = [];
  //   try {
  //     var uri = Uri.https('https://tasty.p.rapidapi.com', '/recipes/list',
  //         {'from': '0', 'size': '20', 'tags': 'under_30_minutes'});

  //     final responce = await http.get(uri, headers: {
  //       'X-RapidAPI-Key': '6a47072b79msh96c3a500819a09cp1d21c1jsn2ed71708b603',
  //       'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
  //     });
  //     print('will get the responce now');

  //     Map data = jsonDecode(responce.body);

  //     for (var i in data['feed']) {
  //       _temp.add(i['content']['details']);
  //     }
  //     print(_temp);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return Recipe.recipesFromSnapshot(_temp);
  // }

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

  @override
  Stream<List<Recipe>> readRecipesEntries() {
    // TODO: implement readRecipesEntries
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRecipe(String recId) {
    // TODO: implement deleteRecipe
    throw UnimplementedError();
  }
}
