import 'package:flutter/cupertino.dart';

bool isCollapsed = true;
int current = 0;
List QUANTITY = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
];
List recentSearch = [];

List Dish_name = [
  'Salmon Bowl',
  'Curd Rice',
  'Chocolate',
  'Rice Noodles',
  'Salad',
  'Cake',
  'Yogurt',
  'Potato Balls',
  ' Tomato Soup',
];

List Price = [
  145 ,
  120 ,
  90 ,
  185 ,
  160 ,
  210 ,
  130 ,
  70 ,
  140 ,
];
List ImagesPath = [
  'images/plate1.png',
  'images/plate2.png',
  'images/plate3.png',
  'images/plate4.png',
  'images/plate5.png',
  'images/plate6.png',
  'images/plate7.png',
  'images/plate8.png',
  'images/plate9.png',
];

List Cart_items_name =[];
List Cart_items_image =[];
List Cart_items_price  =[];
List Cart_item_quantity =[];




int last_quantity =0;

int cart_items=0;


int total_cost(){
  int item_total=0;
  for( int i=0 ; i<Cart_items_name.length;i++)
  {
    item_total += Cart_items_price[i] * Cart_item_quantity [i];
  }
  return item_total;
}


int notification_integer =0;
int discount_price(){
  int DISCOUNTPRICE = (total_cost()*.1).toInt();
  if(DISCOUNTPRICE >= 100)
    return 100;
  else
    return -DISCOUNTPRICE;

}
int to_pay_price(){
  return eligible_for_discount?total_cost()+ discount_price():total_cost();
}

//
String promo_code_entered;
String valid_promo_code ='WELCOME';
bool eligible_for_discount= false;


String customer_name;
String room_number;
int mobile_number;
String special_instruction;
List userDetails = [
  customer_name,
  room_number,
  mobile_number,
  special_instruction,
];

TextEditingController customer_name_controller = new TextEditingController();
TextEditingController room_number_controller = new TextEditingController();
TextEditingController mobile_number_controller = new TextEditingController();
TextEditingController special_instruction_controller= new TextEditingController();

List userDetails_controller = [
  customer_name_controller,
  room_number_controller,
  mobile_number_controller,
  special_instruction_controller,
];
//
//RegExp mobile_exp = new RegExp(r"^[6-9]\d{9}$");

String patttern = r'(^[6-9]\d{9}$)';
RegExp mobile_exp = new RegExp(patttern);

bool autoValidation = false;







//List salmon
