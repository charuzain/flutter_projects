import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/widgets/list_tile.dart';
import 'package:to_do/widgets/task_list.dart';

import 'main.dart';
import 'model/task.dart';

class HomeScreen extends StatefulWidget {
 HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool? selected = false;
  late String newTask;
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (BuildContext context, value, Widget? child) =>
       Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(

            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: (Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                           Text(
                            "Add Task",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 38, color: Colors.lightBlueAccent),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            autofocus: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.lightBlueAccent,
                                width: 5,
                              )),
                            ),
                            onChanged: (val){
                              newTask = val;

                            },
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              print("-----------");
                              print(newTask);
                              value.addTask(Task(taskName: newTask));
                              // setState(() {
                              //   taskList.add(Task(taskName: newTask));
                              // });
                             Navigator.pop(context);

                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Add",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.lightBlueAccent),
                            ),
                          )
                        ],
                      )),
                    );
                  });
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
            backgroundColor: Colors.lightBlueAccent),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      size: 60,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Todoey",
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Text(
                      value.sizeTaskList().toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                       EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  // child: TaskList(taskList: value.taskList,),
                  child: TaskList(),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
