import 'package:flutter/material.dart';
import 'package:food_carousel/detailPage.dart';
import 'constant.dart';


class DataSearch extends SearchDelegate<String>{
  @override
  TextInputType get keyboardType {
    return TextInputType.text;
  }
  //TextCapitalization.characters ;




//  textCapitalization: TextCapitalization.characters,

//  List cities =[
//    'Chocolate',
//    'Salad',
//    'Soup',
//    'Salmon cake',
//    'Coffee',
//    'Stuffed bread',
//    'Pizza',
//
//  ];
//
//  List recentCities = [
//    'Salmon cake',
//    'Coffee',
//
//  ];
  @override
  List<Widget> buildActions(BuildContext context) {


    //  implement buildActions
    return[ IconButton(
      icon: Icon(Icons.clear),
      onPressed: (){
        query ='';
        showSuggestions(context);

      },
    )];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // implement buildLeading

    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,

      ),
      onPressed: (){
        close(context, null);
        showSuggestions(context);

      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //implement buildResults


      int list_index = Dish_name.indexOf(query) ;

      if(recentSearch.indexOf(query) ==-1)
        {

          recentSearch.add(query);
        }
      else
        {

          recentSearch.remove(query);
          recentSearch.add(query);

      }



      return DetailPage(detailfoodname_index: list_index,
      detailprice_index: list_index,
      detailherotag_index:  list_index,
      quantity_index: list_index);





  }

  @override
  Widget buildSuggestions(BuildContext context) {


    //implement buildSuggestions
   // if(query !='')
     //query = query[0].toUpperCase();
    //query = query.toLowerCase();
    final suggestion_list = query.isEmpty?
    recentSearch.reversed.toList():
    Dish_name.where((p){
      return p.startsWith(query);
     // query = query.toLowerCase();

    }).toList();

    return ListView.builder(
      itemBuilder: (context,index){
        
        return ListTile(
          onTap: (){
            query = suggestion_list[index];
//            if(Dish_name.indexOf(query) !=-1){

              print(index);
              showResults(context);
          //  Navigator.of(context).pop();
//            }

          },
            leading: Icon(Icons.fastfood),


            title: RichText(
              text: TextSpan(
                  text: suggestion_list[index].substring(0,query.length),
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(
                        text: suggestion_list[index].substring(query.length),
                        style: TextStyle(
                          color: Colors.grey,
                        )
                    )
                  ]
              ),
            )


        );
      },
      itemCount: suggestion_list.length,

    );

  }

}
