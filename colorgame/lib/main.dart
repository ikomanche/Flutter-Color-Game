import 'package:colorgame/gameOver.dart';
import 'package:flutter/material.dart';

import '3x3.dart';
import '4x4.dart';
import '5x5.dart';
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
      //home: MyHomePage('Color Game'),
      routes: {
        '/':(context) => MyHomePage('Color Game'),
        '/3x3':(context) => MainPart3x3(),
        '/4x4':(context) => MainPart4x4(),
        '/5x5':(context) => MainPart5x5(),
        '/gameOver':(context) => GameOverScreen()
      },
      initialRoute: '/',
    );
  }
}


