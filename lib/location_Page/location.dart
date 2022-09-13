import 'package:flutter/material.dart';
import 'package:world_time/Draw/drawPage.dart';
import 'package:world_time/location_Page/cityWidget.dart';
import 'package:world_time/location_Page/continentsWidget.dart';
import 'package:world_time/time_data.dart';

import '../loadingTime.dart';
import '../timeCity/time.dart';

class Location extends StatefulWidget {
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Map<String , List<String>> data = Data.times;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Locations' , style: TextStyle(color: Colors.black45 , fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: Colors.black45),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: data.entries.map((values) =>
                    Container(
                        child: Column(
                          children: [
                            Continents(values.key),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                color: Color(0xFFE8E8E8),
                                padding: EdgeInsets.only(top: 20 , bottom: 20),
                                child: Row(
                                  children: values.value.map((city) => InkWell(
                                    onTap:(){
                                      LoadingTime.city = city;
                                      LoadingTime.continent = values.key;
                                      Navigator.pushNamed(context, '/loadtime');
                                    },
                                    child: City(city))).toList()
                                ),
                              ),
                            ),
                          ],
                        ))).toList()
              )
            )
          ],
        )
      ),
      drawer: DrawPage(),
    );
  }
}
