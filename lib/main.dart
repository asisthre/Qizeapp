import 'package:flutter/material.dart';

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
  List<Widget> scoreKeeper=[];
  List<String> question=[
    "Flutter is created by google.",
    "Mt.everest is not the highest mountain of the world.",
    "Birds can fly."
  ];
  int questionNumber=0;
  List<bool> answers=[true,false,true];

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
                question[questionNumber],
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
                setState(() {
                  if(answers[questionNumber]==true){
                    scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                          size:24,
                        ));
                  }
                  else{
                    scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                          size:24,
                        ));
                  }
                  questionNumber++;
                });
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
                setState(() {
                  if(answers[questionNumber]==false){
                    scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                          size:24,
                        ));
                  }
                  else{
                    scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                          size:24,
                        ));
                  }
                  questionNumber++;
                });
              },
            ),
          ),
        ),
       Row(
         children: scoreKeeper,
       ),
      ],
    );
  }
}