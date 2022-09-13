import 'package:flutter/material.dart';

class Continents extends StatelessWidget {
  final continent;
  Continents(this.continent);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20 , bottom: 10),
      child: Container(
        child: Row(
          children: [
            SizedBox(width: 20),
            Image.asset('assets/${img(continent)}' , width: 30),
            SizedBox(width: 12),
            Text('${continent}' , style:TextStyle(fontSize: 20 , color: Colors.black45))
          ],
        ),
      ),
    );
  }
}
// To Get Image of continent
img(String continent){
  String image = 'africa.png';
  switch (continent){
    case 'Africa':
      image ='africa.png';
      break;
    case 'America':
      image ='america.png';
      break;
    case 'Asia':
      image ='asia.png';
      break;
    case 'Atlantic':
      image ='atlantic.png';
      break;
    case 'Australia':
      image ='australia.png';
      break;
    case 'Europe':
      image ='europe.png';
      break;
    case 'Indian':
      image ='indian.png';
      break;
    case 'Pacific':
      image ='pacific.png';
      break;
  }
  return image;
}