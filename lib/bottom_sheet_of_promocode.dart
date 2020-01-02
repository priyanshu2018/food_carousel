import 'package:flutter/material.dart';
import 'package:food_carousel/constant.dart';

final TextEditingController _controller = new TextEditingController();

class PromoCode extends StatefulWidget {

  @override
  _PromoCodeState createState() => _PromoCodeState();
}


class _PromoCodeState extends State<PromoCode> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedPadding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            right: 20,
            left: 20,
            top: 20),
        duration: Duration(milliseconds: 100),
        child: Wrap(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
        keyboardType: TextInputType.text,
           textCapitalization: TextCapitalization.characters,
              controller: _controller,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter Promocode',

                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
              onChanged: (value) {

                  promo_code_entered = value;
                  print('value :$promo_code_entered');


              },
            ),
            RaisedButton(
              elevation: 4,
              color: Colors.amberAccent,
              onPressed: () {
                Navigator.of(context).pop();
                _controller.clear();
                if(promo_code_entered.isNotEmpty){
                  showDialog(
                    barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        if (promo_code_entered != valid_promo_code) {
                          eligible_for_discount = false;
                          return AlertDialog(title: Text(
                            'Promocode Is Invalid',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red
                            ),

                          ),
                            elevation: 5,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                          content: Text(
                            'Try using "WELCOME" to get 10% off upto Rs 100.',
                            style: TextStyle(
                              fontSize: 15
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Icon(Icons.cancel,

                              color: Colors.red,),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                            )
                          ],);
//
                        } else {
                          eligible_for_discount = true;
                          return AlertDialog(title: Text(
                            'CONGRATULATION',
                            style: TextStyle(
                                fontSize: 20,
                              color: Colors.green,
                            ),


                          ),
                            elevation: 5,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                            content: Text(
                                'Now you are eligible to get 10% off.',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(

                                child: Icon(Icons.check_box,
                                  color: Colors.green,),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              )
                            ],);

                        }
                      });
                }

              },
              child: Center(
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

