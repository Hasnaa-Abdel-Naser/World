import 'package:flutter/material.dart';

class City extends StatelessWidget {
  final city;
  City(this.city);
  @override
  Widget build(BuildContext context) {
    // This Condition to Edit on City like( Indiana/Indianapolis ) to (Indianapolis)
    String Edit_city = (city.indexOf('/') == -1)? city : city.substring(city.lastIndexOf('/')+1);

    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 10 , right: 10 ),
        width: 120, height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Text('${Edit_city}' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold))
    );
  }
}
