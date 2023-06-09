import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meal_app/data/categoryList.dart';
import 'package:transparent_image/transparent_image.dart';

import '../provider/filter_provider.dart';
import '../widgets/meal_item_meta_data.dart';

class FilteredMeal extends StatelessWidget {
  FilteredMeal({required this.filtersSelected, super.key}) {
  
    filteredMeal = dummyMeals
        .where((meal) => meal.categories
            .contains(filtersSelected[FiltersSelected.selectedCategory]))
        .where((meal) {
      if (!meal.isGlutenFree &&
          filtersSelected[FiltersSelected.gluten] as bool) {
        return false;
      }
      if (!meal.isLactoseFree &&
          filtersSelected[FiltersSelected.lactose] as bool) {
        return false;
      }
      if (!meal.isVegan && filtersSelected[FiltersSelected.vegan] as bool) {
        return false;
      }

      if (!meal.isVegetarian &&
          filtersSelected[FiltersSelected.vegetarian] as bool) {
        return false;
      }
      return true;
    }).toList();

    // .where((meal) =>
    //     filtersSelected[FiltersSelected.gluten] == meal.isGlutenFree)
    // .where((meal) =>
    //     filtersSelected[FiltersSelected.lactose] == meal.isLactoseFree)
    // .where((meal) =>
    //     filtersSelected[FiltersSelected.vegetarian] == meal.isVegetarian)
    // .where((meal) => filtersSelected[FiltersSelected.vegan] == meal.isVegan)
    // .where((meal) => meal.categories
    //     .contains(filtersSelected[FiltersSelected.selectedCategory]))
    // .toList();

    print(filteredMeal);
  }
  Map<FiltersSelected, Object> filtersSelected;
  late List filteredMeal;
  // final List filteredMeal = dummyMeals;

  // final List filteredMeal = dummyMeals.where(
  //     (meal) => filtersSelected[FiltersSelected.gluten] == !meal.isGlutenFree).toList();

  // print(filtersSelected)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filtered Meals")),
      body: ListView.builder(
        itemCount: filteredMeal.length,
        itemBuilder: (context, index) => SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  print("-----------");
                  print(filtersSelected);
                  print(filtersSelected[FiltersSelected.gluten]);
                  print(filtersSelected[FiltersSelected.selectedCategory]);
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: NetworkImage(filteredMeal[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          color: Colors.black45,
                          child: Column(
                            children: [
                              Text(
                                filteredMeal[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.center,
                                softWrap: true,
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  MealItemMetaData(
                                    title:
                                        '${filteredMeal[index].duration.toString()} mins',
                                    icon: Icons.timer,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
