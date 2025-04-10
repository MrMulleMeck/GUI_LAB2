import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/widgets/recipe_list_item.dart';
import 'package:lab2/ui_controller.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeHandler = context.watch<RecipeHandler>();
    final uiController = Provider.of<UIController>(context, listen: false);
    var recipes = recipeHandler.bestMatches;

    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return RecipeListItem(
          recipes[index],
          onTap: () {
            uiController.selectRecipe(recipes[index]);
          }, 
        );
      },
    );
}
}