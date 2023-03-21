import 'package:flutter/material.dart';
import 'package:recipeapp/features/recipes/data/models/recipe.dart';
import 'package:recipeapp/views/widgets/recipe_card.dart';

import '../features/recipes/data/models/recipe_responce.dart';

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
          widget.recipe.name!,
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.recipe.name!,
            child: RecipeCard(
              title: widget.recipe.name!,
              cookTime: (widget.recipe.cookTimeMinutes!).toString(),
              rating: widget.recipe.cookTimeMinutes.toString(),
              thumbURL: widget.recipe.thumbnailUrl!,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.recipe.description!,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}
