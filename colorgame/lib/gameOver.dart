import 'package:colorgame/3x3.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Over"),
        centerTitle: true,
      ),
      body: Container(
          height: double.infinity,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Your Score',textAlign: TextAlign.center,
              style: TextStyle(color: Colors.yellow,
              fontFamily: 'Bangers',
              fontSize: 48),),
              Padding(padding: EdgeInsets.only(bottom: 100),
              child: Text(args.score.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 96,
              fontFamily: 'Bangers'),))
              ,
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow)),
                  child: Text('Return Main Menu',style: TextStyle(color: Colors.red),))
            ],
          ),
        ),
      
    );
  }
}
