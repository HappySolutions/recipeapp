import 'package:flutter/material.dart';
import 'package:recipeapp/features/recipes/data/models/recipe.dart';
import 'package:recipeapp/features/recipes/data/repos/recipes_repo.dart';
import 'package:recipeapp/features/recipes/presentation/screens/details_page.dart';
import 'package:recipeapp/features/recipes/presentation/widgets/recipe_card.dart';

import '../widgets/navbar.dart';

class HomePage extends StatefulWidget {
  final RecipesRepo recipesRepo;

  const HomePage({super.key, required this.recipesRepo});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Recipe>>? recipelist;
  final _query = '';

  @override
  void initState() {
    super.initState();
    recipelist = widget.recipesRepo.getRecipeList(query: _query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu_book,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              pinned: true,
              expandedHeight: 200.0,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Food Recipes'),
                  ],
                ),
                background: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuQYeqJDIUQlJk5ZZOquYjdJrxBUa_BhJfQQ&usqp=CAU',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Recent Recipes',
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
