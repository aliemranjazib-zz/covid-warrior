import 'package:covidpk/constant.dart';
import 'package:covidpk/drawer/adddrawer.dart';
import 'package:covidpk/homescreen/mainpage.dart';
import 'package:covidpk/selfTest/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CheckyourCovidScreen extends StatefulWidget {
  static const String routeName = '/CHeckyourCovidScreen';
  @override
  _CheckyourCovidScreenState createState() => _CheckyourCovidScreenState();
}

class _CheckyourCovidScreenState extends State<CheckyourCovidScreen> {
  List<Icon> scoreKeeper = [];
  int ts = 0;
  QuizBrain quizBrain = QuizBrain();

  res(int ts) {
    if (ts > 6) {
      return 'Your chances to infected from COVID-19 is very high. You should consult a doctor immediately';
    } else if (ts > 3 && ts < 6) {
      return "Your chances to infected from COVID-19 is moderate. But you should take care of yourself.";
    } else if (ts < 3) {
      return 'Congratulations you have no chance to infected by COVID-19.';
    }
  }

  void checkAnswer(bool userAnswer) {
    setState(() {
      bool correctAnswer = quizBrain.getQuestionAnswer();
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "END OF Self Test",
          desc: "${res(ts)}",
          buttons: [
            DialogButton(
              child: Text(
                "Check Again",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {
                quizBrain.reset();
                ts = 0;
                scoreKeeper = [];
                Navigator.pop(context);
              },
              width: 120,
            ),
            DialogButton(
              color: Colors.blue,
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {
                quizBrain.reset();
                ts = 0;
                scoreKeeper = [];
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => MainPage()));
              },
              width: 120,
            )
          ],
        ).show();
      }
      if (userAnswer == correctAnswer) {
        ts++;
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'SELF COVID TEST',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'YES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  //The user picked true.
                  checkAnswer(true);
                  quizBrain.isFinished();
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'NO',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //The user picked false.
                  checkAnswer(false);
                  quizBrain.isFinished();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
