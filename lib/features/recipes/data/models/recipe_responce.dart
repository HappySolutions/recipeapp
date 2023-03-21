import 'package:json_annotation/json_annotation.dart';
import 'package:recipeapp/features/recipes/data/models/recipe.dart';

part 'recipe_responce.g.dart';

// import 'dart:ffi';

// class RecipeResponce {
//   List<Feed>? feed;
//   RecipeResponce({this.feed});

//   RecipeResponce.fromJson(Map<String, dynamic> json) {
//     if (json['feed'] != null) {
//       feed = <Feed>[];
//       json['feed'].forEach((v) {
//         feed!.add(Feed.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (feed != null) {
//       data['feed'] = feed!.map((v) => v.toJson()).toList();
//     }

//     return data;
//   }
// }

// class Feed {
//   Content? content;

//   Feed({this.content});
//   Feed.fromJson(Map<String, dynamic> json) {
//     content =
//         json['content'] != null ? Content.fromJson(json['content']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (content != null) {
//       data['content'] = content!.toJson();
//     }
//     return data;
//   }
// }

// class Content {
//   Description? description;
//   Details? details;

//   Content({this.description, this.details});

//   Content.fromJson(Map<String, dynamic> json) {
//     description = json['description'] != null
//         ? Description.fromJson(json['description'])
//         : null;

//     details =
//         json['details'] != null ? Details.fromJson(json['details']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (description != null) {
//       data['description'] = description!.toJson();
//     }

//     if (details != null) {
//       data['details'] = details!.toJson();
//     }
//     return data;
//   }
// }

// class Description {
//   String? text;

//   Description({this.text});

//   Description.fromJson(Map<String, dynamic> json) {
//     text = json['text'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['text'] = text;
//     return data;
//   }
// }

// @JsonSerializable(createToJson: false)
// class Recipe {
//   String? totalTime;
//   String? images;
//   String? name;
//   String? id;
//   double? rating;
//   String? title;

//   Recipe({
//     this.totalTime,
//     this.images,
//     this.name,
//     this.id,
//     this.rating,
//   });

//   factory Recipe.fromJson(Map<String, dynamic> json) {
//     return Recipe(
//       name: json['name'] as String,
//       id: json['id'] as String,
//       images: '',
//       totalTime: json['totalTime'] as String,
//       rating: json['rating'] as double,
//     );
// totalTime = json['totalTime'];
// if (json['images'] != null) {
//   images = <Images>[];
//   json['images'].forEach((v) {
//     images!.add(Images.fromJson(v));
//   });
// }
// name = json['name'];
// id = json['id'];
// rating = json['rating'];
// title = json['title'];
// }

// static Future<List<Recipe>> recipesFromSnapshot(List snapshot) async {
//   return snapshot.map((data) {
//     return Recipe.fromJson(data);
//   }).toList();
// }

// @override
// String toString() {
//   return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
// }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data['totalTime'] = totalTime;
//   if (images != null) {
//     data['images'] = images!.map((v) => v.toJson()).toList();
//   }
//   data['name'] = name;
//   data['id'] = id;
//   data['rating'] = rating;
//   data['title'] = title;
//   return data;
// }
// }

// @JsonSerializable(createToJson: false)
// class Images {
//   String? hostedLargeUrl;

//   Images({this.hostedLargeUrl});

//   Images.fromJson(Map<String, dynamic> json) {
//     hostedLargeUrl = json['hostedLargeUrl'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['hostedLargeUrl'] = hostedLargeUrl;
//     return data;
//   }
// }

@JsonSerializable(createToJson: false)
class RecipesResponce {
  List<RecipeResp>? results;

  RecipesResponce({this.results});

  factory RecipesResponce.fromJson(Map<String, dynamic> json) =>
      _$RecipesResponceFromJson(json);

  // RecipeResponce.fromJson(Map<String, dynamic> json) {
  //   if (json['results'] != null) {
  //     results = <Recipe>[];
  //     json['results'].forEach((v) {
  //       results!.add(Recipe.fromJson(v));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (results != null) {
  //     data['results'] = results!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
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
  // Recipe.fromJson(Map<String, dynamic> json) {
  //   cookTimeMinutes = json['cook_time_minutes'];
  //   description = json['description'];
  //   thumbnailUrl = json['thumbnail_url'];
  //   totalTimeMinutes = json['total_time_minutes'];
  //   name = json['name'];
  //   id = json['id'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['cook_time_minutes'] = cookTimeMinutes;
  //   data['description'] = description;
  //   data['thumbnail_url'] = thumbnailUrl;
  //   data['total_time_minutes'] = totalTimeMinutes;
  //   data['name'] = name;
  //   data['id'] = id;
  //   return data;
  // }

  // static Future<List<Recipe>> recipesFromSnapshot(List snapshot) async {
  //   return snapshot.map((data) {
  //     return Recipe.fromJson(data);
  //   }).toList();
  // }

  // factory Recipe.fromResponce(Results responce) {
  //   final resulrs = responce.results;

  // }
}
