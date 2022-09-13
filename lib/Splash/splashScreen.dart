import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  late String nextPage;
  isLogin() async{
    final prefs = await SharedPreferences.getInstance();
    String email =  prefs.getString('email') ?? '';
    String password =  prefs.getString('password') ?? '';
    print(email);
    print(password);
    if(email != '' && password != ''){
      nextPage = '/load';
      print(email);
      print(nextPage);
    }
    else{
      nextPage = '/login';
    }
  }
  void initState() {
    super.initState();
    isLogin();
    goToNextPage();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFB688),
        body: Center(
            child : Text('World Time',
                style: TextStyle(fontWeight: FontWeight.w500 ,
                                 color: Colors.white,
                                  fontSize: 30, fontFamily: 'DaysOne'))
        )
    );
  }
  void goToNextPage(){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, nextPage);
    });
  }
}
