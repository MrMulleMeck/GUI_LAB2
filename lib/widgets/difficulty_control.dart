import 'package:flutter/material.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';
import 'package:lab2/app_theme.dart';

class DifficultyControl extends StatefulWidget {
   const DifficultyControl({super.key});

   @override
   State<DifficultyControl> createState() => _DifficultyControlState();
}

class _DifficultyControlState extends State<DifficultyControl> {
  String _difficulty = Difficulty.labels[0];
   @override
   Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
      return Column(
    children: [
      for (int i = 0; i < Difficulty.labels.length; i++)
        RadioListTile<String>(
          dense: true,
          value: Difficulty.labels[i],
          groupValue: _difficulty,
          onChanged: (value) {
            recipeHandler.setDifficulty(value);
            setState(() {
              _difficulty = value!;
              });
            },
            title: Difficulty.icons[i] == null ? Text(Difficulty.labels[i]) // För 'Visa alla'
            : Row(children: [
              Difficulty.icons[i]!,
              const SizedBox(width: AppTheme.paddingMedium),
              Text(Difficulty.labels[i]),
            ],
            )
         ),  // RadioListTile
      ],
  );
   }
}