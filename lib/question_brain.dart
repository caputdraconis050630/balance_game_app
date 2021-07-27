import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
class QuizBank{

  int _questionNumber = 0;

  List<Question> _questions = [
    Question('A:애인 집에서 다른 이성의 팬티\nVS\nB:다른 이성의 집에서 애인의 팬티','애인 집에서 다른 이성의 팬티', '다른 이성의 집에서 애인의 팬티'),
  ];


  int getQuestionNum(){
    return _questionNumber;
  }

  String getQuestionText(){
    return _questions[_questionNumber].questionText;
  }

  String getAnswer1Text(){
    return _questions[_questionNumber].answer1;
  }

  String getAnswer2Text(){
    return _questions[_questionNumber].answer2;
  }


  // Returning If next Question is exist.
  bool available(){
    bool available = true;
    if(_questionNumber == _questions.length - 1){
      available = false;
    }
    return available;
  }

  // If available, Ready For next Question.
  void nextQuestion(){
    _questionNumber++;
  }


}
