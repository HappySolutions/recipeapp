import '../models/recipe.dart';
import '../models/recipe_responce.dart';

abstract class RecipesRepo {
  Future<Recipe> getRecipe(String id);
  Future<List<Recipe>> getRecipeList({String query = ''});
  Future<void> addRecipeToFav(Recipe recipe);
  Future<void> removeRecipeFromFav(String recipeId);
  Future<List<Recipe>> getFavRecipeList();
}
