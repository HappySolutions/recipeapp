// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipesResponce _$RecipesResponceFromJson(Map<String, dynamic> json) =>
    RecipesResponce(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => RecipeResp.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

RecipeResp _$RecipeRespFromJson(Map<String, dynamic> json) => RecipeResp(
      cookTimeMinutes: json['cookTimeMinutes'] as int?,
      description: json['description'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      name: json['name'] as String?,
      id: json['id'] as int?,
    );
