//@dart=2.6

import 'package:flutter/material.dart';
import 'package:kro/Screens/SplashScreen.dart';
import 'package:kro/constants.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primaryColor:primaryColor,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary:primaryColor, //change background color of button
              onPrimary: Colors.white, //change text color of button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )),

      ),
     debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}

