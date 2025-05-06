import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';

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
            recipe.customImage(height: 200, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(recipe.name, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(recipe.description),
            const SizedBox(height: 16),
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
            Text('Ingredienser:', style: Theme.of(context).textTheme.titleMedium),
            ...recipe.ingredients.map((i) => Text('• $i')).toList(),
          ],
        ),
      ),
    );
  }
}
