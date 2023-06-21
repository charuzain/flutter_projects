import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/meal.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.selectedMeal});
  final Meal selectedMeal;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.network(
            selectedMeal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Text("Ingredients",
              style: TextStyle(
                  fontSize: 32, color: Theme.of(context).colorScheme.primary)),
          SizedBox(
            height: 5,
          ),
          ...selectedMeal.ingredients.map(
            (ingredient) => Text(
              ingredient,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text("Steps",
              style: TextStyle(
                  fontSize: 32, color: Theme.of(context).colorScheme.primary)),
          const SizedBox(
            height: 5,
          ),
          for (final step in selectedMeal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                step,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
        ]),
      ),
    ));
  }
}

// class MealDetail extends StatelessWidget {
//   MealDetail({super.key , required this.selectedMeal});

//   final Meal selectedMeal;
//   @override
//   build(BuildContext context) {
//     return (Scaffold(
//       appBar: AppBar(title: Text("MEal Deyail")),
//     ));
//   }
// }
