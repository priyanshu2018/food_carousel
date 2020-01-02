import 'package:flutter/material.dart';
import 'package:food_carousel/afterorder.dart';
import 'constant.dart';
import 'checkout_box_snackbar.dart';


class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final GlobalKey<FormState>  form_key = GlobalKey<FormState>();
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.amber,
          elevation: 0.0,
          title: Text(
            'Checkout',
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                autovalidate: autoValidation,
                key: form_key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      drawText_form_field(LabelText: 'NAME',Leading_icons: Icons.person, HintText: 'Enter Your Name',UserDetail_Index: 0,globalKey: form_key,keyboard_type: TextInputType.text ,UserDetail_Controller_Index: 0, ValidationFunction: ( values){
                        return values.isEmpty?
                        'Name is required':
                        null;
                      },),
                    drawText_form_field(LabelText: 'CAMPUS LOCATION ',Leading_icons: Icons.location_city, HintText: 'Enter LOCATION ',UserDetail_Index: 1,globalKey: form_key,keyboard_type: TextInputType.text,UserDetail_Controller_Index: 1,ValidationFunction: (values){
                      return values.isEmpty?
                      'Address is required':
                      values.length<3?'Please enter valid campus location':null;

                    },),
                    drawText_form_field(LabelText: 'MOBILE NUMBER',Leading_icons: Icons.contact_phone, HintText: 'Enter Your Mobile Number',UserDetail_Index: 2,globalKey: form_key,keyboard_type: TextInputType.number,UserDetail_Controller_Index: 2, ValidationFunction: (values){
                      return values.isEmpty?
                      'Mobile number is required':
                      !mobile_exp.hasMatch(values)?'Enter a valid mobile number.':null;

                    },),
                    SizedBox(
                      height: 20,
                    ),


                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                padding: EdgeInsets.all(10),


                color: Colors.amber,
                highlightColor: Colors.amberAccent,
                onPressed: (){
                  setState(() {
                    if(!form_key.currentState.validate())
                    {
                      autoValidation = true;

                      return;
                    }

                    else
                    {
                      form_key.currentState.save();
                      customer_name_controller.clear();
                    room_number_controller.clear();
                    mobile_number_controller.clear();
                    special_instruction_controller.clear();
                    autoValidation = false;
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>Show_Current_undelivered_order() ));



                    }


                  });

                },
                child: Text(
                    'Place Order',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'
                  ),
                ),
              ),
            )
          ],
        ));
  }
}




class drawText_form_field extends StatelessWidget {
  final LabelText;
  final ValidationFunction;
  final HintText;
  final UserDetail_Index;
  final UserDetail_Controller_Index;
  final globalKey;
  final keyboard_type;
  final Leading_icons;
 //final bool auto_Validation;
  drawText_form_field({this.LabelText,this.ValidationFunction,this.HintText,this.UserDetail_Index,this.globalKey,this.keyboard_type ,this.UserDetail_Controller_Index, this.Leading_icons} );


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: userDetails_controller[UserDetail_Controller_Index] ,
      //autovalidate: autoValidation,
      autofocus: true,
      keyboardType: keyboard_type,

      validator: ValidationFunction,

     // onFieldSubmitted: globalKey.currentState.validate(),
      onSaved: (values){
        userDetails[UserDetail_Index] = values;

       // globalKey.currentState.validate();



      },
      decoration: InputDecoration(
        icon: Icon(Leading_icons),
        labelText: LabelText,
        hintText: HintText,

      ),

    );
  }
}

