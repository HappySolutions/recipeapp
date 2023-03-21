import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipeapp/features/recipes/data/models/recipe.dart';

// class RecipeApi {
//   static Future<List<Recipe>> getRecipe() async {
//     List _temp = [];
//     try {
//       print('will try now');
//       var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
//           {'limit': '24', 'start': '0'});

//       final responce = await http.get(uri, headers: {
//         'X-RapidAPI-Key': '6a47072b79msh96c3a500819a09cp1d21c1jsn2ed71708b603',
//         'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
//         'useQueryString': 'true'
//       });
//       print('will get the responce now');

//       Map data = jsonDecode(responce.body);

//       for (var i in data['feed']) {
//         _temp.add(i['content']['details']);
//       }
//       print(_temp);
//     } catch (e) {
//       print(e.toString());
//     }
//     return Recipe.recipesFromSnapshot(_temp);
//   }
// }
