import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
class QuizBank{

  int _questionNumber = 0;

  List<Question> _questions = [
    Question('A:애인 집에서 다른 이성의 팬티\nVS\nB:다른 이성의 집에서 애인의 팬티','애인 집에서 다른 이성의 팬티', '다른 이성의 집에서 애인의 팬티'),
    Question('A:남사친의 그것이 긴게 좋다\nVS\nB:남사친의 그것이 짧은게 좋다','남사친의 그것이 긴게 좋다', '남사친의 그것이 짧은게 좋다'),
    Question('A:절친 여동생이랑 사귀기\nVS\nB:내 여동생이 절친이랑 사귀기','절친 여동생이랑 사귀기', '내 여동생이 절친이랑 사귀기'),
    Question('A:혼전순결\nVS\nB:혼전동거','혼전순결', '혼전동거'),
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

  void restartGame(){
    _questionNumber = 0;
  }
}
