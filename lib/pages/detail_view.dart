import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:lab2/util/difficulty.dart';


class DetailView extends StatelessWidget {
  final Recipe recipe;

  const DetailView(this.recipe, {super.key});

  @override
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text(recipe.name)),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Vänsterspalt: kvadratisk bild, flagga och centrerad ingredienslista
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: recipe.customImage(fit: BoxFit.cover),
                        ),
                        if (Cuisine.flag(recipe.cuisine) != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Cuisine.flag(recipe.cuisine)!,
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Ingredienser:',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${recipe.servings} portioner',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    ...recipe.ingredients.map(
                      (i) => Text(
                        '${i.amount} ${i.unit} ${i.name}',
                        textAlign: TextAlign.center,
                      ),
                    ).toList(),
                  ],
                ),
              ),

              const SizedBox(width: 32),

              // Högerspalt: titel, metadata, beskrivning, tillagning
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),

                    // Metadata-rad: tid, pris, typ och svårighet
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
                          MainIngredient.icon(recipe.mainIngredient, width: 24)!,
                        const SizedBox(width: 8),
                        if (Difficulty.icon(recipe.difficulty) != null)
                          Difficulty.icon(recipe.difficulty, width: 32)!,
                      ],
                    ),

                    const SizedBox(height: 16),
                    Text(recipe.description),

                    const SizedBox(height: 24),
                    Text(
                      'Tillagning:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(recipe.instruction),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}


}
