import 'package:balance_game/question_brain.dart';
import 'package:balance_game/repository.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'repository.dart'

void main() => runApp(BalanceGame());

class BalanceGame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: QuestionPage(
      ),
    );
  }
}



class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  QuizBank quizBank = QuizBank();
  Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex:12,
                child: Center(
                  child: Text(
                    quizBank.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'NotoSansKR'
                    )
                  )
                )
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: TextButton(
                      onPressed: (){
                        setState(() {
                          // Put User's Answer Into Repository
                          repository.storeRepository(quizBank.getAnswer1Text());

                          if(quizBank.available()){
                            quizBank.nextQuestion();
                          }else{
                            quizBank.restartGame();
                            Alert(
                                context: context,
                                type: AlertType.error,
                                title: '허우,, 쉽지 않은 분이군요',
                                desc: "당신에 대해서 정리해봤어요!\n쉽지 않으시네요..",
                                buttons:[
                                  DialogButton(
                                      child: Text(
                                        "확인하러 가기",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      onPressed: ()=>{

                                      }
                                  ),
                                ]
                            ).show();

                          }
                        });

                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        'A',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),

                    ),
                    ),
                    SizedBox(
                      width:10.0,
                    ),

                    Expanded(
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            // Put User's Answer Into Repository
                            repository.storeRepository(quizBank.getAnswer2Text());

                            if(quizBank.available()){
                              quizBank.nextQuestion();
                            }else{
                              quizBank.restartGame();
                              Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: '허우,, 쉽지 않은 분이군요',
                                  desc: "당신에 대해서 정리해봤어요!\n쉽지 않으시네요..",
                                  buttons:[
                                    DialogButton(
                                        child: Text(
                                          "확인하러 가기",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        onPressed: ()=>{
                                          print(repository.Answers)
                                        }
                                    ),
                                  ]
                              ).show();

                            }
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          'B',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}






