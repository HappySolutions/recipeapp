import 'package:recipeapp/features/recipes/data/models/recipe.dart';
import 'package:recipeapp/features/recipes/data/repos/recipes_repo.dart';

class FirebaseRecipesRepo implements RecipesRepo {
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

  @override
  Future<void> removeRecipeFromFav(String recipeId) {
    // TODO: implement removeRecipeFromFav
    throw UnimplementedError();
  }
}
