import 'package:flutter/material.dart';

import '3x3.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(            
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.red,
      ),
      //home: MyHomePage('Color Game'),
      routes: {
        '/':(context) => MyHomePage('Color Game'),
        '/3x3':(context) => EasyMode()
      },
      initialRoute: '/',
    );
  }
}


