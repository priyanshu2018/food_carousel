import 'package:flutter/material.dart';

import 'splash_screen.dart';
import 'constant.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',


      theme: isCollapsed?ThemeData(primarySwatch: Colors.blue,):ThemeData(primaryColor: Colors.red,
          brightness: Brightness.dark,
          primarySwatch: Colors.brown),


      home: splash_screen(),



//      initialRoute: '/',
//      routes: {
//        '/': (context) => MyHomePage(),
//        '/second': (context) => DetailPage()
//      },
    );
  }
}


