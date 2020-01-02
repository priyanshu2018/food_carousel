import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'menu.dart';
import 'detailPage.dart';
import 'searchbar.dart';
import 'cart_file.dart';
import 'checkout_box_snackbar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>

{

//  static int Quantity_Salmon_Bowl = 0;
//  final int Quantity_Curd_Rice = 0;
//  final int Quantity_Chocolate = 0;
//  final int Quantity_Rice_Noodles = 0;
//  final int Quantity_Salad = 0;
//  final int Quantity_Cake = 0;
//  final int Quantity_Yogurt = 0;
//  final int Quantity_Potato_Balls = 0;
//  final int Quantity_Tomato_Soup = 0;

  List<String> card = [
    'assets/food1.jpg',
    'assets/food2.jpg',
    'assets/food3.jpeg',
    'assets/food5.jpg',
    'assets/food4.jpg',
//    'assets/plate1.png',
//    'assets/plate3.png',
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screen_width = size.width;
    double screen_height = size.height;

    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),

      body: Stack(
        children: <Widget>[
          Menu(),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: isCollapsed ? 0 : screen_height * 0.2,
            bottom: isCollapsed ? 0 : screen_width * 0.2,
            left: isCollapsed ? 0 : screen_width * 0.6,
            right: isCollapsed ? 0 : screen_width * -0.4,
            child: Material(
              elevation: 5,
              child:
                  Stack(alignment: Alignment.bottomCenter, children: <Widget>[
                CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      floating: true,
//              snap: true,
                      backgroundColor: Colors.white,
                      leading: IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.teal,
                        onPressed: () {
                          setState(() {
                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      expandedHeight: 50,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'HEALTHY',
                              style: TextStyle(
                                  color: Color(0xFF21BFBD),
                                  fontFamily: 'Montsarrat',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              'FOOD',
                              style: TextStyle(
                                color: Color(0xFF21BFBD),
                                fontFamily: 'Montsarrat',
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),

                      actions: <Widget>[
                        IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Colors.teal,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.teal,
                          onPressed: () {
                            showSearch(

                                context: context, delegate: DataSearch());
                          },
                        ),
                      ],
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        SizedBox(
                          height: 20.0,
                        ),
                        CarouselSlider(
                          onPageChanged: (indexed) {
                            setState(() {
                              current = indexed;
                            });
                          },
                          initialPage: 0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(seconds: 1),
                          // pauseAutoPlayOnTouch: Duration(seconds: 2),
                          //scrollDirection: Axis.vertical,
                          height: 200.0,
                          items: card.map((imgAsset) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),

//                      Text('text ', style: TextStyle(fontSize: 16.0),)
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(imgAsset),
                                    ));
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: map<Widget>(card, (
                            indexed,
                            imgAsset,
                          ) {
                            return Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: current == indexed
                                      ? Colors.redAccent
                                      : Colors.green),
                            );
                          }),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            height: 850,
                            padding:
                                EdgeInsets.only(left: 35, right: 20, top: 10),

                            // height: MediaQuery.of(context).size.height - 282,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(75.0),
                                    bottomLeft: Radius.circular(75.0))),
                            child: Column(
//                    primary: false,
//                    padding: EdgeInsets.only(left: 45.0,right: 20.0,),
                              children: <Widget>[
                                Center(
                                    child: Text(
                                  'MOST SELLED',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF21BFBD)),
                                )),
                                Center(
                                    child: Container(
                                  height: 1,
                                  width: 90,
                                  color: Color(0xFF21BFBD),
                                )),
                                _BuildfoodItems(
                                    context, 0, 0, 0, Colors.black54, 0),
                                _BuildfoodItems(
                                    context, 1, 1, 1, Colors.black54, 1),
                                _BuildfoodItems(
                                    context, 2, 2, 2, Colors.black54, 2),
                                _BuildfoodItems(
                                    context, 3, 3, 3, Colors.black54, 3),
                                _BuildfoodItems(
                                    context, 4, 4, 4, Colors.black54, 4),
                                _BuildfoodItems(
                                    context, 5, 5, 5, Colors.black54, 5),
                                _BuildfoodItems(
                                    context, 6, 6, 6, Colors.black54, 6),
                                _BuildfoodItems(
                                    context, 7, 7, 7, Colors.black54, 7),
                                _BuildfoodItems(
                                    context, 8, 8, 8, Colors.black54, 8),

                                //    _BuildfoodItems(context,'images/blank.jpg','','' , Colors.white),
                              ],
                            ))
                      ]),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildLowerIcons(50, 50, Icons.search, 'SEARCH' , (){

                    },notification_integer),
                    _buildLowerIcons(
                        50, 50, Icons.shopping_basket, 'BAG ITEMS',(){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Cart()));
                    },cart_items),
                    Checkout_snackbar(text_color_snackbar: Colors.red, text_snackbar: 'Your Cart is Empty !')
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
//bottomNavigationBar: Theme(
//  data: Theme.of(context).copyWith(
//      canvasColor: Colors.transparent,
//      primaryColor: Colors.white,
////      primarySwatch: Colors.blue,
//      textTheme: Theme
//          .of(context)
//          .textTheme
//          .copyWith(caption: TextStyle(color: Colors.deepOrange))),
//  child: BottomNavigationBar(
//    type: BottomNavigationBarType.fixed,
//    currentIndex: 0,
//    items: [
//      BottomNavigationBarItem(
//        icon: Icon(Icons.home),
//        title: Text("Home"),
//      ),
//      BottomNavigationBarItem(
//        icon: Icon(Icons.map),
//        title: Text("Map"),
//      )
//    ],
//  ),
//),

//      bottomNavigationBar:  Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[
//          _buildLowerIcons(50, 50, Icons.search),
//          _buildLowerIcons(50, 50, Icons.shopping_basket),
//          Container(
//            height: 50,
//            width: 100,
//            padding: EdgeInsets.only(top: 15,left: 5.0),
//            color: Colors.black,
//            child: Text(
//              'CHECKOUT',
//              style: TextStyle(
//                  color: Colors.white,
//                  fontFamily: 'montserrat',
//                  fontSize: 15.0,
//                  fontWeight: FontWeight.bold
//              ),
//            ),
//
//          )
//        ],
//      ),
    );
  }
}

Widget _BuildfoodItems(BuildContext context, int Imgpath_index,
    int Foodname_index, int Price_index, Color colors, int Quantity_index) {
  return Padding(
    padding: EdgeInsets.only(top: 10.0, right: 10.0),
    child: InkWell(
      onTap: () {
        // Navigator.pushNamed(context, '/second');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      detailfoodname_index: Foodname_index,
                      detailherotag_index: Imgpath_index,
                      detailprice_index: Price_index,
                      quantity_index: Quantity_index,
                    )));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Hero(
            tag: ImagesPath[Imgpath_index],
            child: Image(
              image: AssetImage(ImagesPath[Imgpath_index]),
              fit: BoxFit.cover,
              height: 75.0,
              width: 75.0,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            children: <Widget>[
              Text(
                Dish_name[Foodname_index],
                style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
              ),
//              SizedBox(
//                width: ,
//              ),
              Text(
                Price[Price_index].toString(),
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Montserrat',
                    fontSize: 15.0),
              )
            ],
          ),
          IconButton(
            icon: Icon(Icons.add),
            color: colors,
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}

Widget _buildLowerIcons(
    int boxheight, int boxweight, IconData icon, String msg, Function OnPressed ,  int notification_number){
  return Padding(
    padding: EdgeInsets.only(left: 25.0,bottom: 4),
    child: Container(
      height: boxheight.toDouble(),
      width: boxweight.toDouble(),
      decoration: (BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        border: Border.all(
            color: Colors.grey, style: BorderStyle.solid, width: 1.0),
      )),
      child: Tooltip(
        message: msg,
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            IconButton(
              icon: Icon(icon),
              color: Colors.black,
              onPressed: OnPressed,
            ),
             Container(
                height: 20,
                width: 20,


                decoration: BoxDecoration(
                  color: notification_number!=0?Colors.red:Colors.transparent,
                  shape: BoxShape.circle
                ),
                child:
                Center(
                  child: Text(
                    notification_number.toString(),
                    style: TextStyle(
                      color: notification_number!=0?Colors.white:Colors.transparent
                    ),
                  ),
                ),
              ),


          ],

        ),
      ),
    ),
  );
}
