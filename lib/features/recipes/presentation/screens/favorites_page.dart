import 'package:flutter/material.dart';
import '../../data/models/recipe.dart';
import '../../data/repos/recipes_repo.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/recipe_card.dart';
import 'details_page.dart';

class FavoritePage extends StatefulWidget {
  final RecipesRepo recipesRepo;

  const FavoritePage({super.key, required this.recipesRepo});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Stream<List<Recipe>>? favRecipeslist;

  @override
  void initState() {
    super.initState();
    favRecipeslist = widget.recipesRepo.readRecipesEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          'Favorites',
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Favorites Recipes',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            StreamBuilder<List<Recipe>>(
              stream: favRecipeslist,
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'Something went wrong',
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

                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final recipe = recipes[index];
                      return InkWell(
                        onLongPress: () {
                          var baseDialog = BaseAlertDialog(
                              title: "Confirm Delete",
                              content:
                                  "Are you sure you want to delete the Recipe?",
                              yesOnPressed: () {
                                widget.recipesRepo
                                    .removeRecipeFromFav(recipe.fId!);
                                Navigator.of(context, rootNavigator: true)
                                    .pop(true);
                              },
                              noOnPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop(false);
                              },
                              yes: "Yes",
                              no: "No");
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => baseDialog);
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(recipe: recipe),
                            ),
                          );
                        },
                        child: RecipeCard(
                          title: recipe.name!,
                          rating: (recipe.cookTimeMinutes).toString(),
                          cookTime: (recipe.cookTimeMinutes!).toString(),
                          thumbURL: recipe.thumbnailUrl!,
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
