import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pilot_app/Models/recipes.dart';

class RecipesItem extends StatelessWidget {
  final Recipes recipes;

  const RecipesItem(this.recipes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        children: [
          Container(
            width: 182,
            height: 218,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  recipes.imageUrl.toString(),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Text(
                    recipes.title.toString(),
                    style: const TextStyle(fontSize: 25),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 16, right: 16, left: 16),
                  child: Text(
                    recipes.description.toString(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 14,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 16,
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Color(0xFFf44336),
                          ),
                          Text(
                            recipes.likesNumber.toString(),
                            style: const TextStyle(
                              color: Color(0xFFf44336),
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: Color(0xFFff8f00),
                          ),
                          Text(
                            recipes.readyInMinutes.toString(),
                            style: const TextStyle(
                              color: Color(0xFFff8f00),
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.eco_rounded,
                            color: recipes.isVegan ?? false
                                ? const Color(0xFF00c853)
                                : Colors.grey,
                          ),
                          Text(
                            'Vegan',
                            style: TextStyle(
                              color: recipes.isVegan ?? false
                                  ? const Color(0xFF00c853)
                                  : Colors.grey,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
