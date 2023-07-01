import 'package:flutter/material.dart';
import 'package:grocery/model/grocery_item.dart';

// enum Category { dairy, meat, vegetable, fruit, carbs, sweets, spices, other }

class NewGroceryItem extends StatefulWidget {
  const NewGroceryItem({super.key});

  @override
  State<NewGroceryItem> createState() => _NewGroceryItemState();
}

class _NewGroceryItemState extends State<NewGroceryItem> {
  final _formKey = GlobalKey<FormState>();
  final initialTitle = '';
  final initialQuantity = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Grocery Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: initialTitle,
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Enter the name of grocery item",
                  label: Text("Name"),
                  // border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.trim().isEmpty) {
                    return "Enter some value";
                  }
                  if (value.length > 50) {
                    return "Total character should be less than 50";
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: initialQuantity,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Quantity"),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().isEmpty ||
                            int.tryParse(value) == null) {
                          return "Enter some value / Enter a valid input";
                        }
                        if (int.tryParse(value)! < 0) {
                          return "Quanitity should be a positive number";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(items: [
                      for (final category in GroceryCategory.values)
                        DropdownMenuItem(
                            value: category.name, child: Text(category.name))
                    ], onChanged: (val) {}),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: Text("Reset")),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Save"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
