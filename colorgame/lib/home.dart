import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(title)),
      body: Center(
        child: Column(
          children: [
            LimitedBox(
              maxHeight: 250,
              child: Container(
                height: 100,
                color: Colors.yellow,
                child: Center(
                  child: Text(
                    'Choose a Level',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            LimitedBox(
              maxHeight: 750,
              child: Container(
                height: 250,
                color: Colors.blue,
                child: Center(
                  widthFactor: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/3x3');
                          },
                          child: Text('3x3'),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              minimumSize: MaterialStateProperty.all<Size>(Size(150, 100))
                          )
                      ),
                      ElevatedButton(
                          onPressed: null,
                          child: Text('4x4'),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.yellow),
                              minimumSize: MaterialStateProperty.all<Size>(Size(150, 100))
                          )
                      ),
                      ElevatedButton(
                          onPressed: null,
                          child: Text('5x5'),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              minimumSize: MaterialStateProperty.all<Size>(Size(150, 100))
                          )
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
