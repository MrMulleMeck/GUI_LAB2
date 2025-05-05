import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:lab2/util/difficulty.dart';


class RecipeListItem extends StatelessWidget {
  
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  @override
Widget build(BuildContext context) {
  var uiController = Provider.of<UIController>(context, listen: false);
    return Card(
    child: Container(
      height: 128,
      child: Row(
        children: [
        _image(recipe),
        Expanded(
          child: Column(
            children: [
  Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Text(
      recipe.name,
      style: AppTheme.mediumHeading,
    ),
  ),
  Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      recipe.description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
  ),

Row(
  children: [
    const Icon(Icons.access_time, size: 16),
    const SizedBox(width: 4),
    Text('${recipe.time} min'),
    const SizedBox(width: 16),

    const Icon(Icons.attach_money, size: 16),
    const SizedBox(width: 4),
    Text('${recipe.price} kr'),
    const SizedBox(width: 16),

    if (MainIngredient.icon(recipe.mainIngredient) != null)
      MainIngredient.icon(recipe.mainIngredient)!,
    const SizedBox(width: 16),

    if (Difficulty.icon(recipe.difficulty) != null)
      Difficulty.icon(recipe.difficulty, width: 48)!,
  ],
),

],

          ),
         ),
       ],
     ),
    ),
  );
  }
  Widget _image(Recipe recipe) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: recipe.customImage(fit: BoxFit.cover, width: 96, height:96),
  );
}
}