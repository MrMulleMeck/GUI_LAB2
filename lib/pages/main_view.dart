import 'package:flutter/material.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _controlPanel(context), 
          Expanded(child: _recipeArea(context))
        ]
      ),
    );
  }

  Widget _controlPanel(context, {double width = 320}){
    return Container(
      width:width,
      color: const Color.fromARGB(255, 193, 210, 218),

      child: Column(
        children: const[
          Text(
            'Receptsök',
            style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Hitta ett recept som passar genom att ändra\ninställningarna nedanför.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Ingrediens:',
                style: TextStyle(fontSize: 14),
              ),
                SizedBox(width: 12),
                IngredientControl(),
            ]
          ),
        SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Kök:',
                style: TextStyle(fontSize: 14),
              ),
                SizedBox(width: 12),
                CuisineControl(),
            ]
          ),
        ]
      )
      );
  }

  Widget _recipeArea(context) {
   return Expanded(
      child: Container(
        color: const Color.fromARGB(255, 204, 216, 176)
      ),
   );
}
}
