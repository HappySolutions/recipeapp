import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/features/recipes/data/models/recipe.dart';
import 'package:recipeapp/features/recipes/presentation/widgets/recipe_card.dart';

class DetailsPage extends StatefulWidget {
  final Recipe recipe;
  const DetailsPage({super.key, required this.recipe});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isPressed = false;
  Future createRecipeEntry(Recipe favRecipe) async {
    final docRecipe =
        FirebaseFirestore.instance.collection('recipeentries').doc();
    favRecipe.fId = docRecipe.id;
    final json = favRecipe.toJson();
    await docRecipe.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.recipe.name!,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(widget.recipe.thumbnailUrl!),
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
                        Text(
                          widget.recipe.name!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Cooking Time Per Minutes:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              (widget.recipe.cookTimeMinutes)!.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Description:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.recipe.description!,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final favRecipe = Recipe(
              name: widget.recipe.name,
              description: widget.recipe.description,
              thumbnailUrl: widget.recipe.thumbnailUrl,
              cookTimeMinutes: widget.recipe.cookTimeMinutes);
          createRecipeEntry(favRecipe);
          setState(() => isPressed = !isPressed);
        },
        child: const Icon(Icons.favorite_sharp),
        backgroundColor: isPressed ? Colors.red : Colors.blue,
      ),
    );
  }
}
