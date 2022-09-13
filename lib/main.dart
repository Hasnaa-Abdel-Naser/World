import 'package:flutter/material.dart';
import 'package:world_time/Login_Page/loginPage.dart';
import 'package:world_time/Splash/splashScreen.dart';
import 'package:world_time/loading.dart';
import 'package:world_time/loadingTime.dart';
import 'package:world_time/timeCity/time.dart';
import 'location_Page/location.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/home',
          routes:{
            '/home' : (context)=> SplashScreen(),
            '/login': (context)=> LoginPage(),
            '/load': (context)=> Loading(),
            '/location': (context)=> Location(),
            '/loadtime': (context)=> LoadingTime(),
            '/timePage': (context)=> Time(),
          }
      )
  );
}

