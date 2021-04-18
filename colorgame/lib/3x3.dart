import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class EasyMode extends StatefulWidget {
  @override
  _EasyModeState createState() => _EasyModeState();
}

class _EasyModeState extends State<EasyMode> {  
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
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = getRandomColor();
    int randomIndex = getRandomIndex();

    return Scaffold(
        appBar: AppBar(
          title: Text("3x3 Easy Mode"),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          //color: Colors.green,
          child: Column(
            children: [
              Container(
                height: 200,
                color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
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
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            minimumSize:
                                MaterialStateProperty.all(Size(150, 90)),
                            //side: MaterialStateProperty.all(BorderSide(width: 5)),
                          ),
                        )
                      ],
                    ),
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
                            backgroundColor:
                                MaterialStateProperty.all(mainColor),
                            minimumSize:
                                MaterialStateProperty.all(Size(150, 90)),
                            side:
                                MaterialStateProperty.all(BorderSide(width: 5)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  height: 510,
                  //color: Colors.blue,
                  child: GridView.count(
                    crossAxisCount: 3,
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: List.generate(9, (index) {
                      return ElevatedButton(
                        onPressed: () => _startTimer(),
                        child: null,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              randomIndex == index
                                  ? mainColor
                                  : getRandomColor()),
                          side: MaterialStateProperty.all(BorderSide(width: 5)),
                        ),
                      );
                    }),
                  ))
            ],
          ),
        ));
  }
}
