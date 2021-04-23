import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'Score.dart';

class MainPart3x3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("3x3 Easy Mode"),
        centerTitle: true,
      ),
      body: Container(
        //height: double.infinity,
        child: Column(
          children: [TimeCounter(), ColorMatch()],
        ),
      ),
    );
  }
}

class TimeCounter extends StatefulWidget {
  @override
  _TimeCounterState createState() => _TimeCounterState();
}

int globalscore = 0;

class _TimeCounterState extends State<TimeCounter> {
  int _counter = 60;
  Timer _timer;

  void _startTimer() {
    _counter = 60;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
          Navigator.pushNamed(context, '/gameOver',
              arguments: ScreenArguments(globalscore));
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    globalscore = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        color: Colors.yellow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'TIME :',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  wordSpacing: 5,
                  letterSpacing: 15),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text(
                '$_counter',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    wordSpacing: 20,
                    letterSpacing: 10,
                    color: Colors.red),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                minimumSize: MaterialStateProperty.all(Size(150, 90)),
                //side: MaterialStateProperty.all(BorderSide(width: 5)),
              ),
            )
          ],
        ));
  }
}

class ColorMatch extends StatefulWidget {
  @override
  _ColorMatchState createState() => _ColorMatchState();
}

class _ColorMatchState extends State<ColorMatch> {
  getRandomColor() {
    var randomColorValueR = Random().nextInt(255);
    var randomColorValueB = Random().nextInt(255);
    var randomColorValueG = Random().nextInt(255);
    Color randomCOlor = Color.fromARGB(
        255, randomColorValueR, randomColorValueB, randomColorValueG);
    return randomCOlor;
  }

  getRandomIndex() {
    var randomIndex = Random().nextInt(8);
    return randomIndex;
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = getRandomColor();
    int randomIndex = getRandomIndex();
    return Container(
      height: 620,
      //color: Colors.blue,
      child: Column(
        children: [
          Container(
              height: 100,
              color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'NEXT ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 48,
                            wordSpacing: 20,
                            letterSpacing: 15),
                      ),
                      ElevatedButton(
                        onPressed: null,
                        child: null,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(mainColor),
                          minimumSize: MaterialStateProperty.all(Size(150, 90)),
                          side: MaterialStateProperty.all(BorderSide(width: 5)),
                        ),
                      )
                    ],
                  )
                ],
              )),
          Container(
            height: 520,
            child: GridView.count(
              crossAxisCount: 3,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(9, (index) {
                return ElevatedButton(
                  onPressed: randomIndex == index
                      ? () {
                          setState(() {
                            mainColor = getRandomColor();
                            randomIndex = getRandomIndex();
                            globalscore += 10;
                          });
                        }
                      : () {
                          globalscore -= 10;
                        },
                  child: null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        randomIndex == index ? mainColor : getRandomColor()),
                    side: MaterialStateProperty.all(BorderSide(width: 5)),
                  ),
                );
              }),
            ),
            //color: Colors.green,
          )
        ],
      ),
    );
  }
}
