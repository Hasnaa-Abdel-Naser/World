import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static bool isChecked = false;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void initState() {
    super.initState();
  }
  final  Email = TextEditingController();
  final  Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double mediaheight = MediaQuery.of(context).size.height;
    double mediawidth = MediaQuery.of(context).size.width;
    Color mainColor = Color(0xFFFFA56B);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(left: 20 , right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: mediaheight*0.16),
                    Text('Hello Again!' ,
                    style: TextStyle(fontSize: 27 , fontWeight: FontWeight.bold),),
                    SizedBox(height: mediaheight*0.03),
                    Text('Welcome back you\'ve' ,
                    style: TextStyle(fontSize: 22 ,color: Colors.grey)),
                    Text('been missed!' ,
                    style: TextStyle(fontSize: 22 ,color: Colors.grey)),
                    SizedBox(height: mediaheight*0.1),
                    TextFormField(
                      controller: Email,
                      decoration: InputDecoration(
                        label: Text('Email' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold)),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xFFFFA56B), width: 1.0 ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller : Password,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text('Password' , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold)),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Color(0xFFFFA56B), width: 1.0 ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    Row(
                      children: [
                        Checkbox(value: LoginPage.isChecked, activeColor: mainColor ,  onChanged: (value){
                          setState(() {
                            LoginPage.isChecked = value!;
                          });
                        }),
                        Text('Remember me')
                      ],
                    ),
                    SizedBox(height: mediaheight*0.05),
                    InkWell(
                      onTap:() async{
                        if(Email.text != '' && Password.text != ''){
                          if(LoginPage.isChecked == true){
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString('email', Email.text);
                            prefs.setString('password', Password.text);
                          }
                          Navigator.pushReplacementNamed(context, '/load');
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: mediaheight*0.07,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(35)
                        ),
                        child: Text('Login' , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 18))
                      ),
                    ),
                  ]
               )
            )
          )
        )
    );
  }
}
