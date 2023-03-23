import 'package:flutter/material.dart';
import 'package:recipeapp/features/recipes/data/models/recipe.dart';
import 'package:recipeapp/features/recipes/data/repos/recipes_repo.dart';
import 'package:recipeapp/features/recipes/presentation/screens/details_page.dart';
import 'package:recipeapp/features/recipes/presentation/widgets/recipe_card.dart';

import '../../data/models/recipe_responce.dart';

class HomePage extends StatefulWidget {
  final RecipesRepo recipesRepo;

  const HomePage({super.key, required this.recipesRepo});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Recipe>>? recipelist;
  var _query = '';
  @override
  void initState() {
    super.initState();
    recipelist = widget.recipesRepo.getRecipeList(query: _query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text('Food Recipes'),
          ],
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Recipes List',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            FutureBuilder<List<Recipe>>(
              future: recipelist,
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'Something wen wrong',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                }
                if (!snapshot.hasData) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final recipes = snapshot.data ?? [];
                if (recipes.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(
                        child: Text(
                      'No Reicpes found',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final recipe = recipes[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(recipe: recipe),
                            ),
                          );
                        },
                        child: Hero(
                          tag: recipe.name!,
                          child: RecipeCard(
                            title: recipe.name!,
                            rating: (recipe.cookTimeMinutes).toString(),
                            cookTime: (recipe.cookTimeMinutes!).toString(),
                            thumbURL: recipe.thumbnailUrl!,
                          ),
                        ),
                      );
                    },
                    childCount: recipes.length,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: recipelist.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1,
//               ),
//               itemBuilder: (BuildContext context, index) {
//                 return InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DetailsPage(
//                           recipe: recipelist[index],
//                         ),
//                       ),
//                     );
//                   },
//                   child: Hero(
//                     tag: recipelist[index].name, //London
//                     child: RecipeCard(
//                       title: recipelist[index].name,
//                       cookTime: recipelist[index].totalTime,
//                       rating: recipelist[index].rating.toString(),
//                       thumbURL: recipelist[index].images,
//                     ),
//                   ),
//                 );
//               },
//             ),
          



