import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/time_data.dart';

class LoadingTime extends StatefulWidget {

  static String city = 'Cairo';
  static String continent = 'Africa';
  @override
  State<LoadingTime> createState() => _LoadingTimeState();
}
class _LoadingTimeState extends State<LoadingTime> {
  GetTime() async{
    Data obj = Data();
    String time = await obj.getTime(LoadingTime.continent, LoadingTime.city);
    String send = (time.length == 8)? time[0]+time[1]+time[6] : time[0]+time[5];
    String img = await Imagetype(send);
    Navigator.pushReplacementNamed(context,'/timePage' , arguments: {
       'city': LoadingTime.city,
      'continent': LoadingTime.continent,
      'time': time,
      'image': img
    });
  }
  Imagetype(time){
    String img = 'morning.jpg';
    switch (time){
      case '5P':case '6P':
      case '7P':case '8P':
      case '9P':case '10P':
      case '11P':case '12A':
      case '1A':case '2A':
      case '3A':case '4A':
      case '5A':
        img = 'night.jpg';
        break;
      default:
        img = 'morning.jpg';
    }
    return img;
  }
  void initState() {
    super.initState();
    GetTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFA56B),
        body:Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 40,
          ),
        )
    );
  }
}
