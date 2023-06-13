import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/expense_list.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        backgroundColor: const Color.fromARGB(255, 69, 13, 89),
      ),
      body: Column(
        children: [
          Text("Chart"),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Text(expenseList[index].title),
              itemCount: expenseList.length,
            ),
          )
        ],
      ),
    );
  }
}
