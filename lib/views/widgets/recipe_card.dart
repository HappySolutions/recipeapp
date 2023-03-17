import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbURL;
  const RecipeCard({
    Key? key,
    required this.title,
    required this.rating,
    required this.cookTime,
    required this.thumbURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(thumbURL),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            // ignore: sort_child_properties_last
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 19),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            // ignore: sort_child_properties_last
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Text(rating),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(cookTime),
                    ],
                  ),
                ),
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}
