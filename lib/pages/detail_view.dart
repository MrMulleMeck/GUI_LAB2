import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';



class DetailView extends StatelessWidget {
  final Recipe recipe;

  const DetailView(this.recipe, {super.key});

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
              // Vänsterspalt: bild + flagga + ingredienser
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        recipe.customImage(height: 200, fit: BoxFit.cover),
                        if (Cuisine.flag(recipe.cuisine) != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Cuisine.flag(recipe.cuisine)!,
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text('Ingredienser:', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('${recipe.servings} portioner',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 8),
                    ...recipe.ingredients.map((i) => Text('${i.amount} ${i.unit} ${i.name}')).toList(),

                  ],
                ),
              ),

              const SizedBox(width: 32),

              // Högerspalt: titel, metadata, beskrivning
              Expanded(
  flex: 2,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(recipe.name, style: Theme.of(context).textTheme.headlineMedium),
      const SizedBox(height: 8),
      Row(
        children: [
          const Icon(Icons.access_time),
          const SizedBox(width: 4),
          Text('${recipe.time} min'),
          const SizedBox(width: 16),
          const Icon(Icons.attach_money),
          const SizedBox(width: 4),
          Text('${recipe.price} kr'),
        ],
      ),
      const SizedBox(height: 16),
      Text(recipe.description),

      const SizedBox(height: 24),
      Text('Tillagning:', style: Theme.of(context).textTheme.titleMedium),
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
