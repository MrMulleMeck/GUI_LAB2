import 'package:flutter/material.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/time_control.dart';
import 'package:lab2/widgets/recipe_list.dart';
import 'package:lab2/widgets/recipe_detail.dart';
import 'package:lab2/widgets/recipe_area.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _controlPanel(context), 
          const Expanded(child: RecipeArea())

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

        SizedBox(height: 16),

        Text(
          'Svårhetsgrad:',
           style: TextStyle(fontSize: 18),
        ),

        
            
        DifficultyControl(),

         Text(
          'Maxpris:',
           style: TextStyle(fontSize: 18),
        ),

        PriceControl(),
        SizedBox(height: 22),

            Text(
          'Maxtid:',
           style: TextStyle(fontSize: 18),
        ),

        TimeControl(),

        ]
      )
      );
  }

}
