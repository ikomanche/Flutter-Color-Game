import 'package:colorgame/3x3.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Game OVer"),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        color: Colors.green,
        child: Container(
          height: double.infinity,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Your Score'),
              Text(args.score.toString()),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Return Main Menu'))
            ],
          ),
        ),
      ),
    );
  }
}
