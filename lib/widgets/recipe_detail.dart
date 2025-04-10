import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetail(this.recipe, {super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: uiController.deselectRecipe,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            recipe.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: recipe.customImage(),
          ),
        ],
      ),
    );
  }
}
