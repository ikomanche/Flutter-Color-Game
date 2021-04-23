import 'package:colorgame/gameOver.dart';
import 'package:flutter/material.dart';

import 'gameScene.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(    
      debugShowCheckedModeBanner: false,        
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.red,
      ),
      
      routes: {
        '/':(context) => MyHomePage('Color Game'),
        '/startGame':(context) => MainPart(),
        '/gameOver':(context) => GameOverScreen()
      },
      initialRoute: '/',
    );
  }
}


