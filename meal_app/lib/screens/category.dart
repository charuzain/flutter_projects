import 'package:flutter/material.dart';

import '../data/categoryList.dart';
import 'catergory_item.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meals Category")),
      body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: categoryList
              .map((category) =>
                  Expanded(child: CatergoryItem(category: category)))
              .toList()),
    );
  }
}
