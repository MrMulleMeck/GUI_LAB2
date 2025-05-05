import 'package:flutter/material.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/logo.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/time_control.dart';

class ControlPanel extends StatelessWidget {
  final double width;

  const ControlPanel({super.key, this.width = 320});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Column(
        children: [
          Logo(),
          const SizedBox(height: 8),
          const Text(
            'Hitta ett recept som passar genom att ändra\ninställningarna nedanför.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),

          IngredientControl(),
          CuisineControl(),
          const SizedBox(height: 16),

          const Text('Svårhetsgrad:', style: TextStyle(fontSize: 18)),
          const DifficultyControl(),

          const Text('Maxpris:', style: TextStyle(fontSize: 18)),
          const PriceControl(),
          const SizedBox(height: 22),

          const Text('Maxtid:', style: TextStyle(fontSize: 18)),
          const TimeControl(),
        ],
      ),
    );
  }
}
