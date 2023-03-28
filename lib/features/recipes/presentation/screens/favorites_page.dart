import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/recipe.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/recipe_card.dart';
import 'details_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Stream<List<Recipe>> readRecipesEntries() => FirebaseFirestore.instance
      .collection('recipeentries')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());

  Future<void> deleteRecipe(String recId) {
    return FirebaseFirestore.instance
        .collection('recipeentries')
        .doc(recId)
        .delete();
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
              stream: readRecipesEntries(),
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                deleteRecipe(recipe.fId!);
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
