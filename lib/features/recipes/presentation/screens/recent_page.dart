import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/recipe.dart';
import '../../data/repos/recipes_repo.dart';
import '../widgets/recipe_card.dart';
import 'details_page.dart';

class RecentPage extends StatefulWidget {
  final RecipesRepo recipesR;

  const RecentPage({super.key, required this.recipesR});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  Future<List<Recipe>>? recipelist;
  var _query = '';

  @override
  void initState() {
    super.initState();
    // recipelist = widget.recipesRepo.getRecipeList(query: _query);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
