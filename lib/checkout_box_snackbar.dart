import 'package:flutter/material.dart';
import 'constant.dart';
import 'checkout_page.dart';

class Checkout_snackbar extends StatelessWidget {
  final text_color_snackbar;
  final text_snackbar;
  Checkout_snackbar({this.text_color_snackbar,this.text_snackbar});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){
        if(Cart_items_name.isNotEmpty)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CheckOut()));
        else


          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(text_snackbar,
          style: TextStyle(
            color: text_color_snackbar,
            fontSize: 20,
          ),)));
      },
      child: Container(
        height: 50,
        width: 100,
        padding: EdgeInsets.only(top: 15, left: 5.0),
        color: Colors.black,
        child: Text(
          'CHECKOUT',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'montserrat',
              fontSize: 15.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
