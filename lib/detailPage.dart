import 'package:flutter/material.dart';
import 'package:food_carousel/constant.dart';
import 'cart_file.dart';
import 'constant.dart';

var selectedCard = 'WEIGHT';

class DetailPage extends StatefulWidget {
  final detailherotag_index;
  final detailfoodname_index;
  final detailprice_index;
  final quantity_index;

  DetailPage(
      {this.detailprice_index,
      this.detailfoodname_index,
      this.detailherotag_index,
      this.quantity_index});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color offColour = Color(0xFF7A9BEE);

  Color oncolour = Colors.white;

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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 157,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45))),
                    ),
                  ),
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height:
                                (MediaQuery.of(context).size.width / 2) + 10,
                            width: (MediaQuery.of(context).size.width / 2) + 10,
                            child: Hero(
                              tag: ImagesPath[widget.detailherotag_index],
                              child: Image(
                                image: AssetImage(ImagesPath[widget.detailherotag_index]),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        Dish_name[widget.detailfoodname_index],
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            Price[widget.detailprice_index].toString(),
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Montserrat',
                                fontSize: 20.0),
                          ),
                          Container(
                            height: 25,
                            width: 3,
                            color: Colors.grey,
                          ),
                          Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                              color: Color(0xFF7A9BEE),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: IconButton(
                                    icon: Icon(Icons.remove),
                                    iconSize: 15,
                                    color: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        if(QUANTITY[widget.quantity_index ] >=1)
                                          {
//                                            print(QUANTITY[widget.quantity_index ] );
//                                            print('hello');

                                            QUANTITY[widget.quantity_index]--;
                                            cart_items--;
                                          }


                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  QUANTITY[widget.quantity_index].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.0, left: 20),
                                  child: Container(
//                              padding: EdgeInsets.only(right: 20),
                                    height: 30,
                                    width: 30,

                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      iconSize: 15,
                                      color: Color(0xFF7A9BEE),
                                      onPressed: () {
                                        setState(() {
                                          QUANTITY[widget.quantity_index]++;
                                          cart_items++;

                                        });
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            CardView(
                                title: 'WEIGHTS',
                                mass: '400',
                                quantity: '(gm)',
                                OnTap: () {
                                  setState(() {
                                    selectedCard = 'WEIGHTS';
                                  });
                                }),
                            CardView(
                              title: 'CALORIES',
                              mass: '240',
                              quantity: '(gm)',
                              OnTap: () {
                                setState(() {
                                  selectedCard = 'CALORIES';
                                });
                              },
                            ),
                            CardView(
                              title: 'SUGAR',
                              mass: '620',
                              quantity: '(gm)',
                              OnTap: () {
                                setState(() {
                                  selectedCard = 'SUGAR';
                                });
                              },
                            ),
                            CardView(
                              title: 'FATS',
                              mass: '155',
                              quantity: '(gm)',
                              OnTap: () {
                                setState(() {
                                  selectedCard = 'FATS';
                                });
                              },
                            ),
                            CardView(
                              title: 'PROTEINS',
                              mass: '356',
                              quantity: '(gm)',
                              OnTap: () {
                                setState(() {
                                  selectedCard = 'PROTEINS';
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          FlatButton(
            splashColor: Colors.greenAccent,

            padding: EdgeInsets.all(1),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.green,
              child: Center(
                child: Text(
                  'ADD TO BAG',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onPressed: () {

              print(cart_items);
              if(QUANTITY[widget.quantity_index] != 0 )
                {
                  if( Cart_items_name.indexOf(Dish_name[widget.detailfoodname_index]) !=-1 )
                    {

                      
                      Cart_item_quantity.remove(last_quantity );
                      Cart_items_image.remove(ImagesPath[widget.detailherotag_index]);
                      Cart_items_name.remove(Dish_name[widget.detailfoodname_index]);
                      Cart_items_price.remove(Price[widget.detailprice_index]);

                     



                      Cart_item_quantity.add(QUANTITY[widget.quantity_index] );

                      last_quantity = QUANTITY[widget.quantity_index];
                      
                      Cart_items_image.add(ImagesPath[widget.detailherotag_index]);
                      Cart_items_name.add(Dish_name[widget.detailfoodname_index]);
                      Cart_items_price.add(Price[widget.detailprice_index]);
//
                    }




                  else
                    {



                    Cart_item_quantity.add(QUANTITY[widget.quantity_index] );
                    
                    last_quantity = QUANTITY[widget.quantity_index];
                    


                    Cart_items_image.add(ImagesPath[widget.detailherotag_index]);
                    Cart_items_name.add(Dish_name[widget.detailfoodname_index]);
                    Cart_items_price.add(Price[widget.detailprice_index]);

                    }

                }
              else //if( Cart_items_name.indexOf(Dish_name[widget.detailfoodname_index]) !=-1 )
                {



                  if( Cart_items_name.indexOf(Dish_name[widget.detailfoodname_index]) !=-1 )

                    Cart_item_quantity.remove(last_quantity);
                    Cart_items_image.remove(ImagesPath[widget.detailherotag_index]);
                    Cart_items_name.remove(Dish_name[widget.detailfoodname_index]);
                    Cart_items_price.remove(Price[widget.detailprice_index]);





                }
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));

            },
          )
        ],
      ),
    );
  }
}

class CardView extends StatelessWidget {
  final title;
  final mass;
  final quantity;
  final OnTap;
  CardView({this.title, this.mass, this.quantity, this.OnTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: OnTap,
        child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: selectedCard == title ? Color(0xFF7A9BEE) : Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: selectedCard == title ? Colors.white : Colors.grey),
              ),
              Text(
                mass,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color:
                        selectedCard == title ? Colors.white : Colors.black87),
              ),
              Text(
                quantity,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    color:
                        selectedCard == title ? Colors.white : Colors.black87),
              )
            ],
          ),
        ),
      ),
    );
  }
}
