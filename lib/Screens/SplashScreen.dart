import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kro/Screens/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BottomNavigation.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double containerSize = 150;

  bool islogged=false;
  getdata()
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    islogged=prefs.getBool("loggedin")!;
  }
  @override
  void initState() {
    super.initState();
     getdata();
    Timer(Duration(milliseconds: 100), ()
    {
      onUpdate();
    });
    Timer(Duration(seconds: 5), () {

      if(islogged==true)
      {
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                    MyHomePage()));
      }
      else
      {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
      }

    });
  }

  onUpdate() {
    setState(() {
      containerSize = 300;
    });
  }

  @override
  Widget build(BuildContext context) {

    var deviceHeight=MediaQuery.of(context).size.height;
    var deviceWidth=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width:deviceWidth,
        height: deviceHeight,

        child: Container(
          margin:EdgeInsets.only(top:100),
          child: Center(
            child: AnimatedContainer(
              height: containerSize,
              width: containerSize,
              duration: Duration(seconds:4),
              child: Center(
                child: Image.asset(
                  "assets/logo.png",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

