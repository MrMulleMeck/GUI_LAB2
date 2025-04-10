import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';

class TimeControl extends StatefulWidget {
  const TimeControl({super.key});

  @override
  State<TimeControl> createState() => _TimeControlState();
}

class _TimeControlState extends State<TimeControl> {
  double _price = 60;

  @override
  Widget build(BuildContext context) {
  var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
  return Column(
    children: [
      Slider(
        value: _price,
        divisions: 15,
        max: 150,
        onChanged: (double value) {
          recipeHandler.setMaxTime(value.round());
          setState(() {
            _price = value;
          });
        },
      ),
      Text('${_price.round()} minuter'),
     ],
 );
}
}