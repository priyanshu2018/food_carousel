import 'package:flutter/material.dart';

class Show_Current_undelivered_order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF7A9BEE),
    appBar: AppBar(
    leading: IconButton(
    icon: Icon(Icons.arrow_back_ios),
    color: Colors.white,
    onPressed: () {
    Navigator.pop(context);
    },
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text(
    'DETAILS',
    style: TextStyle(
    color: Colors.white, fontSize: 18.0, fontFamily: 'Montserrat'),
    ),
    centerTitle: true,
    actions: <Widget>[
    IconButton(
    icon: Icon(Icons.more_horiz),
    color: Colors.white,
    onPressed: () {},
    )
    ],
    ),
    body:Container());
  }
}
