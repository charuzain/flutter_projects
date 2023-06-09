import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/answer_button.dart';
import 'data/question_bank.dart';

class Questions extends StatefulWidget {
  Questions(
      {required this.addToAnswerList,
      required this.correctAnswerCount,
      required this.finalScore,
      super.key});

  final Function(String selectedAnswer) addToAnswerList;
  int correctAnswerCount;
  final void Function() finalScore;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  int index = 0;
  String? selectedAnswer;
  String? correctAnswer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              questionBank[index].question,
              style: const TextStyle(color: Colors.white, fontSize: 32),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),

            ...questionBank[index]
                .shuffleQuestion()
                .map((answer) => AnswerButton(
                      question: answer,
                      onClick: () {
                        correctAnswer = questionBank[index].getCorrectAnswer();

                        if (answer == correctAnswer) {
                          widget.finalScore();
                        }
                        widget.addToAnswerList(answer);
                        setState(() {
                          // if (answer == correctAnswer) {
                          //   widget.finalScore();
                          // }
                          index = index + 1;
                          print(index);

                          // print(widget.correctAnswerCount);
                        });
                      },
                    )),
            // AnswerButton(
            //   option: questionBank[index].answers[0],
            //   onClick: () {
            //     setState(() {
            //       print(questionBank);
            //       index = index + 1;
            //     });
            //   },
            // ),
            // AnswerButton(
            //   option: questionBank[index].answers[1],
            //   onClick: () {
            //     setState(() {
            //       index = index + 1;
            //     });
            //   },
            // ),
            // AnswerButton(
            //   option: questionBank[index].answers[2],
            //   onClick: () {
            //     setState(() {
            //       index = index + 1;
            //     });
            //   },
            // ),
            // AnswerButton(
            //   option: questionBank[index].answers[3],
            //   onClick: () {
            //     setState(() {
            //       index = index + 1;
            //     });
            //   },
            // ),

            // const AnswerButton(),
            // const AnswerButton(),
            // const AnswerButton(),
            // const AnswerButton(),
            // const AnswerButton(),
            // const AnswerButton(),
          ],
        ),
      ),
    );
  }
}
