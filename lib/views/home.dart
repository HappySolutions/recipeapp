import 'package:flutter/material.dart';
import 'package:recipeapp/models/recipe.dart';
import 'package:recipeapp/views/details_page.dart';
import 'package:recipeapp/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipelist = [
    Recipe(
        "Cheesy Broccoli Stuffed Chicken (low-carb, Keto)",
        'https://lh3.googleusercontent.com/JM8pq6tZMu4B74G3Gk1FMNh-9rVRgXJaenBTNpZ7icvnPACg-UFaR807kJEdx4TRuLVFOsNmeoniz-4VvrU4MXQ=s360',
        4,
        '40 min'),
    Recipe(
        "Instant Pot Pork Chops",
        "https://lh3.googleusercontent.com/Pftjh5VlatihgjOaf7BXfV9_ijji5sEFH3hC0H0bmCYyzh7YnWNwshxbw8DCkjIkqTJxmsktzoD8GAoH98AwpME=s360",
        5,
        '30 min'),
    Recipe(
        "Air Fryer Lemon Pepper Chicken Thighs",
        "https://lh3.googleusercontent.com/OaoSADoGANokmtd1mMA81ddxVEBwC_cTJE9SWwDwoYL7geFzwnB9jxQrwbHo_VozAyqb9sLwOH3sVtNgx3X5309P5BW-cifbaDhH=s360",
        5,
        '20 min'),
    Recipe(
        "Gluten Free Apple Crisp",
        'https://lh3.googleusercontent.com/d2TJZAKwuXKq4DQHDH27ml9519ENDrU8foZihMvmbDFcAvvyHKErS0--aqW73l3OMLVUqvxX3gOTzri15dV3AQ=s360',
        3,
        '50 min'),
    Recipe(
        "Jalapeno Popper Chicken Soup",
        'https://lh3.googleusercontent.com/F4IEzcZIq5Z_Y5dqrtEC9Op-eAlkRSRqphlzOMi1Tkxxm_-HPHQneC56o_wv3cECRLwevsGw-kN42mzUZGe7Ww=s360',
        4,
        '60 min'),
    Recipe(
        "Kielbasa with Sauerkraut and Potatoes",
        'https://lh3.googleusercontent.com/S5jTMEbrI_ySZyVKxzMznA7FKM4OF3PKoOB7O2gViqFdQXzL2AejyzeqIosKlwAv_1WHZtmPYPuUPYb2v0BCI_U=s360',
        4,
        '20 min'),
  ];

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
        body: SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recipelist.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
            ),
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        recipe: recipelist[index],
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: recipelist[index].name, //London
                  child: RecipeCard(
                    title: recipelist[index].name,
                    cookTime: recipelist[index].totalTime,
                    rating: recipelist[index].rating.toString(),
                    thumbURL: recipelist[index].images,
                  ),
                ),
              );
            },
          ),
        ));
  }
}
