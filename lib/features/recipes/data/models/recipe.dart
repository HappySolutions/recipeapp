import 'package:recipeapp/features/recipes/data/models/recipe_responce.dart';

// class Recipe {
//   final int? id;
//   final String? name;
//   final String? images;
//   final String? rating;
//   final String? totalTime;

//   Recipe(this.id, this.name, this.images, this.rating, this.totalTime);
class Recipe {
  int? cookTimeMinutes;
  String? description;
  String? thumbnailUrl;
  String? name;
  int? id;

  Recipe({
    this.cookTimeMinutes,
    this.description,
    this.thumbnailUrl,
    this.name,
    this.id,
  });

  factory Recipe.fromResponce(RecipeResp responce) {
    final id = responce.id;
    final name = responce.name;
    final cookTimeMinutes = responce.cookTimeMinutes;
    final thumbnailUrl = responce.thumbnailUrl;
    final description = responce.description;

    return Recipe(
        id: id ?? 0,
        name: name ?? '',
        cookTimeMinutes: cookTimeMinutes ?? 0,
        description: description ?? '',
        thumbnailUrl: thumbnailUrl ?? '');
  }
  // factory Recipe.fromJson(dynamic json) {
  //   return Recipe(
  //       json['name'] as String,
  //       json['images'][0]['hostedLargeUrl'] as String,
  //       json['rating'] as double,
  //       json['totalTime'] as String);
  // }

  // static List<Recipe> recipesFromSnapshot(List snapshot) {
  //   return snapshot.map((data) {
  //     return Recipe.fromJson(data);
  //   }).toList();
  // }

  // @override
  // String toString() {
  //   return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  // }

}
