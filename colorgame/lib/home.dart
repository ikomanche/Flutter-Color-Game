import 'package:flutter/material.dart';

class ScreenArguments2 {
  final int mode;
  ScreenArguments2(this.mode);
}

class MyHomePage extends StatelessWidget {
  MyHomePage(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(title)),
      body: Container(
        height: double.infinity,
        color: Colors.blue[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LimitedBox(
              maxHeight: 250,
              child: Container(
                height: 150,
                color: Colors.blue[900],
                child: Center(
                  child: Text(
                    'Choose a Level',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 48,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'ZenDots'),
                  ),
                ),
              ),
            ),
            LimitedBox(
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/startGame',arguments: ScreenArguments2(3));
                          },
                          child: Text('3x3',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  Size(150, 100)))),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/startGame',arguments: ScreenArguments2(4));
                          },
                          child: Text('4x4',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.yellow),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  Size(150, 100)))),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/startGame',arguments: ScreenArguments2(5));
                          },
                          child: Text('5x5',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  Size(150, 100))))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'İlker Kılınçarslan - 160002148',
                style: TextStyle(color: Colors.white,
                fontFamily: 'SourceCodePro'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
