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
  String? fId;

  Recipe(
      {this.cookTimeMinutes,
      this.description,
      this.thumbnailUrl,
      this.name,
      this.id,
      this.fId = ''});

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

  Map<String, dynamic> toJson() => {
        'id': fId,
        'name': name,
        'description': description,
        'thumbnailUrl': thumbnailUrl,
        'cookTimeMinutes': cookTimeMinutes
      };

  static Recipe fromJson(Map<String, dynamic> json) => Recipe(
        fId: json['id'],
        name: json['name'],
        description: json['description'],
        thumbnailUrl: json['thumbnailUrl'],
        cookTimeMinutes: json['cookTimeMinutes'],
      );
}
