import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'question_brain.dart';

QuestionBrain questionBrain= new QuestionBrain();
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score=0;
  List<Widget> scoreKeeper=[];
   checkAnswer({bool userAnswer}){
    setState(() {
      if (questionBrain.isFinished()){
//        Alert(
//            context: context,
//            title:"The number of questions are finished",
//            desc:"You have scored $score question").show();
        Alert(
          context: context,
          title: "The number of questions are finished",
          desc: "You have scored $score question",
          buttons: [
            DialogButton(
              child: Text(
                "Play Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                score=0;
                Navigator.pop(context);
                },
              color: Colors.green,
              radius: BorderRadius.circular(0.0),
            ),
          ],
        ).show();
        scoreKeeper.clear();
        questionBrain.reset();
      }
      else{
        if(questionBrain.getAnswerResult() == userAnswer){
          scoreKeeper.add(
              Icon(
                Icons.check,
                color: Colors.green,
                size:24,
              ));
          score++;
        }
        else{
          scoreKeeper.add(
              Icon(
                Icons.close,
                color: Colors.red,
                size:24,
              ));
        }
        questionBrain.nextQuestion();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                "True",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                  checkAnswer(userAnswer: true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                "False",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(userAnswer: false);
              },
            ),
          ),
        ),
       SingleChildScrollView(
         scrollDirection: Axis.horizontal,
         padding: EdgeInsets.symmetric(vertical: 10.0),
         child: Row(
           children: scoreKeeper,
         ),
       ),
      ],
    );
  }
}