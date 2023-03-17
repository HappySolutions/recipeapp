import 'package:flutter/material.dart';
import 'package:recipeapp/models/recipe.dart';
import 'package:recipeapp/views/widgets/recipe_card.dart';

class DetailsPage extends StatefulWidget {
  final Recipe recipe;
  const DetailsPage({super.key, required this.recipe});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.recipe.name,
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.recipe.name,
            child: RecipeCard(
              title: widget.recipe.name,
              cookTime: widget.recipe.totalTime,
              rating: widget.recipe.rating.toString(),
              thumbURL: widget.recipe.images,
            ),
          ),
        ],
      ),
    );
  }
}
