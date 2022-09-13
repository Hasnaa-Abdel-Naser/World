import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_time/loadingTime.dart';

class Time extends StatefulWidget {
  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  Map<String , dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map<String , dynamic>;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(   // Create Background Image
              width: double.infinity ,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/${data['image']}'),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          Container(
            width: double.infinity ,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x2F030303)
            )
          ),
          Padding(
              padding: EdgeInsets.only(top : size.height * 0.07 , right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(    // To Reload Time
                    onTap:(){
                      setState(() {
                        LoadingTime.city = data['city'];
                        LoadingTime.continent = data['continent'];
                        Navigator.pushReplacementNamed(context,'/loadtime');
                      });
                    },
                      child: Icon(Icons.refresh , size: 35 , color: Colors.white)),
                ],
              )
          ),
          Container(  // Display City Name and Time
            padding: EdgeInsets.only(top: size.height * 0.3),
            width: double.infinity,
            child: Column(
              children: [
                // This Condition to Edit on City like( Indiana/Indianapolis ) to (Indianapolis)
                Text('${(data['city'].indexOf('/') == -1)? data['city'] :
                        data['city'].substring(data['city'].lastIndexOf('/')+1)}'
                    , style: TextStyle(color:Colors.white , fontSize: 40 , fontWeight: FontWeight.bold)),
                Text('${data['time']}' , style: TextStyle(color:Colors.white , fontSize: 30 , fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Positioned(
            bottom: size.height * 0.05,
            left: 10 , right: 10,
            child: InkWell(
              onTap:(){
                Navigator.pushReplacementNamed(context, '/location');
              },
              child: Container(
                  height: size.height*0.07,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0x5CCDCDCD),
                      borderRadius: BorderRadius.circular(35)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on , size: 20 , color: Colors.white),
                      Text('other location' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 18)),
                    ],
                  )
              ),
            ),
          )
        ],
      )
    );
  }
}
