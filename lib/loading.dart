import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/time_data.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  setupWorldTime() async{
    Data obj = Data();
    await obj.getdata();
    Navigator.pushReplacementNamed(context, '/location');
  }

  void initState(){
    super.initState();
    setupWorldTime();
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
