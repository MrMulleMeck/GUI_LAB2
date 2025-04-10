import 'package:flutter/material.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';
import 'package:lab2/widgets/recipe_list.dart';
import 'package:lab2/widgets/recipe_detail.dart';

class RecipeArea extends StatelessWidget {
  const RecipeArea({super.key});

  @override
  Widget build(BuildContext context) {
  final uiController = context.watch<UIController>();

  Widget contents;
  if (uiController.showRecipeList) {
    contents = const RecipeList();
  } else {
    contents = RecipeDetail(uiController.selectedRecipe!);
  }

  return Expanded(child: contents);
}

}