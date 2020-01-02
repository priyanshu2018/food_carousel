import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'bottom_sheet_of_promocode.dart';
import 'checkout_page.dart';




class Cart extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    if ( Cart_items_name.isNotEmpty)
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon : Icon(Icons.arrow_back_ios,
          color: Colors.teal,

          ),
        ),
        elevation: 3,
        title: Text('BASKET',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
          fontFamily: 'assets/Montserrat'
        ),),
        backgroundColor: Colors.white,
        centerTitle: true,

      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          CustomScrollView(
            semanticChildCount: 10,
            slivers: <Widget>[

              SliverList(



                delegate: SliverChildBuilderDelegate((BuildContext context,int index)
                {


                  return Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                color: Colors.red,
                                width: 2,

                              )

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(

                                child: Hero(
                                  tag: Cart_items_image[index],
                                  child: Image(
                                    image: AssetImage(Cart_items_image[index]),
//                            child: Image.asset(Cart_items_image[index])
                                  ),
                                ),
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.teal,
                                      width: 3,

                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(Cart_items_name[index],
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54
                                    ),),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                          Cart_items_price[index].toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54
                                          )
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Rs',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54
                                          )
                                      )
                                    ],
                                  )

                                ],
                              ),


                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:20.0, top: 20),
                        child: Container(

                          height: 20,
                          width: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'X ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 12
                                ),
                              ),
                              Text(
                                  Cart_item_quantity[index].toString()
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                  color: Colors.grey
                              )
                          ),
                        ),
                      )
                    ],

                  );
                },
                  childCount: Cart_items_name.length,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                              color: Colors.teal,
                              width: 2
                          )
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: <Widget>[
                              Text(
                                'Bill Details',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'assets/Montserrat'
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  'Item Total',
                                  style: TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'assets/Montserrat'
                                  )
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                      total_cost().toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'assets/Montserrat'
                                      )
                                  ),
                                  SizedBox(
                                    width: 10 ,
                                  ),
                                  Text(
                                      'Rs' ,
                                      style: TextStyle(
                                          fontSize: 15,
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'assets/Montserrat'
                                      )
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(

                            child: eligible_for_discount?Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                    'Discount',
                                    style: TextStyle(
                                        fontSize: 15,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.lightGreen,
                                        fontFamily: 'assets/Montserrat'
                                    )
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                        discount_price().toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            // fontWeight: FontWeight.bold,
                                            color: Colors.lightGreen,
                                            fontFamily: 'assets/Montserrat'
                                        )
                                    ),
                                    SizedBox(
                                      width: 10 ,
                                    ),
                                    Text(
                                        'Rs' ,
                                        style: TextStyle(
                                            fontSize: 15,
                                            // fontWeight: FontWeight.bold,
                                            color: Colors.lightGreen,
                                            fontFamily: 'assets/Montserrat'
                                        )
                                    ),
                                  ],
                                )
                              ],
                            ):Container()
                          ),

                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width ,
                            height: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  'To Pay',
                                  style: TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'assets/Montserrat'
                                  )
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    to_pay_price().toString(),
                                      style: TextStyle(
                                          fontSize: 15,
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'assets/Montserrat'
                                      )
                                  ),
                                  SizedBox(
                                    width: 10 ,
                                  ),
                                  Text(
                                      'Rs' ,
                                      style: TextStyle(
                                          fontSize: 15,
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'assets/Montserrat'
                                      )
                                  ),
                                ],
                              )
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    onPressed: (){
                      showModalBottomSheet<void>( context: context, builder: (BuildContext context) {



                         return PromoCode();
                      });

                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          //borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                              color: Colors.amber,
                              width: 2
                          )
                      ),

                      child: Row(
                        children: <Widget>[
                          Icon(Icons.local_offer),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Do You Have Promocode ? ',
                              style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'assets/Montserrat'
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height:  100,
                  )
                ]),

              )
            ],
          )
//          ListView.builder(
//               shrinkWrap: true,
//               itemCount: Cart_items_price.length,
//               itemBuilder: (context, index){
//
//                 return Stack(
//                   alignment: Alignment.topRight,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Container(
//                         padding: EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                             border: Border.all(
//                               color: Colors.teal,
//                               width: 2,
//
//                             )
//
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Container(
//
//                               child: Hero(
//                                 tag: Cart_items_image[index],
//                                 child: Image(
//                                   image: AssetImage(Cart_items_image[index]),
////                            child: Image.asset(Cart_items_image[index])
//                                 ),
//                               ),
//                               height: 130,
//                               width: 130,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: Colors.grey,
//                                     width: 1,
//
//                                   ),
//                                   borderRadius: BorderRadius.all(Radius.circular(20))
//                               ),
//                             ),
//                             SizedBox(
//                               width: 40,
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(Cart_items_name[index],
//                                   style: TextStyle(
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black54
//                                   ),),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Text(
//                                     Cart_items_price[index].toString(),
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black54
//                                     )
//                                 )
//
//                               ],
//                             ),
//
//
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right:20.0, top: 20),
//                       child: Container(
//
//                         height: 20,
//                         width: 30,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Text(
//                               'X ',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                   fontSize: 12
//                               ),
//                             ),
//                             Text(
//                                 Cart_item_quantity[index].toString()
//                             ),
//                           ],
//                         ),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(8)),
//                             border: Border.all(
//                                 color: Colors.grey
//                             )
//                         ),
//                       ),
//                     )
//                   ],
//
//                 );
//               }
//           ),

          ,RaisedButton(
            elevation: 4,

            padding: EdgeInsets.all(4),
            child: Container(
              height: 60,
              color: Colors.amber
              ,width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'CHECKOUT ',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontFamily: 'assets/Montserrat'
                  ),
                ),
              ),

            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CheckOut()));

            },
          )
        ],

      )
    );
    else
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon : Icon(Icons.arrow_back_ios,
              color: Colors.teal,

            ),
          ),
          elevation: 3,
          title: Text('BASKET',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
                fontFamily: 'assets/Montserrat'
            ),),
          backgroundColor: Colors.white,
          centerTitle: true,

        ),
        body: Container(
          color: Colors.grey,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text('YOUR BAG IS EMPTY !',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'assets/Montserrat',
              fontWeight: FontWeight.bold
            ),
            ),
            Container(
              height: 200
                ,width: 200,
                color: Colors.transparent,
                child: Image.asset('assets/sad.png')),
          ],
          ),
        ),

      );
  }
}
//
//Widget _Bag_list ( )
//{
//  return Container(
//    child: Row(
//      children: <Widget>[
//        Image.asset(name)
//      ],
//    ),
//
//  );
//}

