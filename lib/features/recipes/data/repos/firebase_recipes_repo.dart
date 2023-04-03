import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipeapp/features/recipes/data/models/recipe.dart';
import 'package:recipeapp/features/recipes/data/repos/recipes_repo.dart';

class FirebaseRecipesRepo implements RecipesRepo {
  @override
  Stream<List<Recipe>> readRecipesEntries() => FirebaseFirestore.instance
      .collection('recipeentries')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());

  @override
  Future<void> removeRecipeFromFav(String recipeId) {
    return FirebaseFirestore.instance
        .collection('recipeentries')
        .doc(recipeId)
        .delete();
  }

  @override
  Future<void> deleteRecipe(String recId) {
    // TODO: implement removeRecipeFromFav
    throw UnimplementedError();
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
  Future<List<Recipe>> getRecipeList({String query = ''}) {
    // TODO: implement getRecipeList
    throw UnimplementedError();
  }
}
