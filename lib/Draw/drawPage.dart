import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Login_Page/loginPage.dart';

class DrawPage extends StatelessWidget {
  const DrawPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/man.png'),
                  backgroundColor: Colors.white,
                    radius: 50
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left : 20 , top : size.height*0.06),
                child: Column(
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.pushReplacementNamed(context, '/location');
                      },
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined , size: 25 , color: Color(0xFFFFA56B)),
                          Text('   Locations Page' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    InkWell(
                      onTap:(){
                        Navigator.pushNamed(context, '/loadtime');
                      },
                      child: Row(
                        children: [
                          Icon(Icons.refresh_rounded , size: 25 , color: Color(0xFFFFA56B)),
                          Text('   Last location time', style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    InkWell(
                      onTap:() async{
                        LoginPage.isChecked = false;
                        final prefs = await SharedPreferences.getInstance();
                        String email =  prefs.getString('email') ?? '';
                        String password =  prefs.getString('password') ?? '';
                        if(email != '' && password != ''){
                          prefs.remove('email');
                          prefs.remove('password');
                        }
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: Row(
                        children: [
                          Icon(Icons.logout , size: 25 , color: Color(0xFFFFA56B)),
                          Text('   Logout', style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}
