import 'package:flutter/material.dart';
import 'package:pilot_app/Models/ingredients.dart';

class IngredientsItem extends StatelessWidget {
  final Ingredients ingredients;

  const IngredientsItem(this.ingredients, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Colors.grey.shade400,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    ingredients.images.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      ingredients.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Text(
                      ingredients.amount.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0x61000000),
                      ),
                    ),
                  ),
                  const Text(
                    "Solid",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0x61000000),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
