import 'package:quizzler/question.dart';

class QuestionBank {
  int num = 0;
  List<Question> _questions = [
    Question('Slug\'s blood is green ?', true),
    Question('Canada is in South America',  false),

    Question('Some cats are actually allergic to humans', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];


  bool isFinished(int num){
    if (num == _questions.length-1){
      return true;
    }
    return false;

  }

  void increaseCount(){
    print(num);
    print(_questions.length);
    if (num < _questions.length-1){
      num = num + 1;
    }

  }

  void resetQuiz(){
    num = 0;
  }

  String getQuestion(int num){
    return _questions[num].question;
  }

  bool getAnswer(int num){
    return _questions[num].answer;
  }
}
