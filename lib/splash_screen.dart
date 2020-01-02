import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home_page.dart';

class splash_screen extends StatefulWidget

{
  @override
  _splash_screenState createState() => _splash_screenState();

}

class _splash_screenState extends State<splash_screen>
{
  @override
  Widget build(BuildContext context) {
    return SplashScreen(


      title: Text(
        'Food CAROUSEL',


        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 45,
        ),
      ),
      image: Image.asset('assets/front1.png',
        color: Colors.white,),
      photoSize: 100,
      navigateAfterSeconds: MyHomePage(),
      seconds: 2,
      backgroundColor: Colors.red,
      loaderColor: Colors.white,
    );
  }
}
