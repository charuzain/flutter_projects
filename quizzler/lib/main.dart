import 'package:flutter/material.dart';
import 'package:quizzler/question_brain.dart';
import 'question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: QuizApp(),
        ),
      ),
      backgroundColor: Colors.black54,
    ));
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int num = 0;

  List<Icon> scoreKeeper = [];
  QuestionBank ques = QuestionBank();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Text(
                ques.questions[num].getQuestion(),
                style: TextStyle(color: Colors.white70, fontSize: 28),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text(
                'True',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                print(ques.questions[num].getQuestion());
                setState(() {
                  print(num);
                  if (ques.questions[num].getAnswer() == true) {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scoreKeeper.add(Icon(
                      Icons.clear,
                      color: Colors.red,
                    ));
                  }
                  num = num + 1;
                  print(num);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (ques.questions[num].getAnswer() == false) {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scoreKeeper.add(Icon(
                      Icons.clear,
                      color: Colors.red,
                    ));
                  }
                  num = num + 1;
                });
              },
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
        Row(children: scoreKeeper)
      ],
    );
  }
}