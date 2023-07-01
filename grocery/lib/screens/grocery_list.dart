import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocery/data/geocerylist_data.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grocery List"),
      ),
      body: ListView.builder(
        itemCount: groceryList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(color: groceryList[index].color),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(groceryList[index].title,
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
              Text(groceryList[index].quantity.toString())
            ],
          ),
        ),
      ),
    );
  }
}