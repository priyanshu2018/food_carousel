
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';



class Menu extends StatefulWidget {

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          isCollapsed =! isCollapsed;

        });




      },
      child: Align(
        alignment: Alignment.centerLeft, //VERY VERY IMPORTANT BACAUSE ANIMATED POSITION SIZE DEPEND ON THIS

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width/2,
              color: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/prince.jpg'),
                        maxRadius: 60.0,

                      ),
                    ),
                    Center(child: Text('Priyanshu',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold, color : Colors.white),)),

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                width: 1
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.dashboard),
                              color: Colors.white,
                            ),
                            Text('Dashboard',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white),),
                          ],
                        )

                    ),
                    SizedBox(height: 8,),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                width: 1
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.format_indent_increase),
                              color: Colors.white,
                            ),
                            Text('Progress',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white),),
                          ],
                        )

                    ),
                    SizedBox(height: 8,),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                width: 1
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.contacts),
                              color: Colors.white,
                            ),
                            Text('Contact Us',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white),),
                          ],
                        )

                    ),
                    SizedBox(height: 8,),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                width: 1
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.accessibility_new),
                              color: Colors.white,
                            ),
                            Text('Suggestion',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white),),
                          ],
                        )

                    ),
                    SizedBox(height: 8,),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                width: 1
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.brightness_auto),
                              color: Colors.white,
                            ),
                            Text('About',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white),),
                          ],
                        )

                    ),

                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
