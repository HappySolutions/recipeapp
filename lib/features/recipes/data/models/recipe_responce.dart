import 'package:json_annotation/json_annotation.dart';

part 'recipe_responce.g.dart';

@JsonSerializable(createToJson: false)
class RecipesResponce {
  List<RecipeResp>? results;

  RecipesResponce({this.results});

  factory RecipesResponce.fromJson(Map<String, dynamic> json) =>
      _$RecipesResponceFromJson(json);
}

@JsonSerializable(createToJson: false)
class RecipeResp {
  int? cookTimeMinutes;
  String? description;
  String? thumbnailUrl;
  String? name;
  int? id;

  RecipeResp({
    this.cookTimeMinutes,
    this.description,
    this.thumbnailUrl,
    this.name,
    this.id,
  });

  factory RecipeResp.fromJson(Map<String, dynamic> json) =>
      _$RecipeRespFromJson(json);
}
