import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class pinDetails extends StatefulWidget {
  const pinDetails({Key? key}) : super(key: key);

  @override
  _pinDetailsState createState() => _pinDetailsState();
}

class _pinDetailsState extends State<pinDetails> {



  SharedPreferences? prefs;
  var user;

  String pin="";
  @override
  void initState() {
    getuserData();
  }

  getuserData()
  async
  {
    prefs = await SharedPreferences.getInstance();


    String? encodedMap = await prefs!.getString('userdata');
    user= json.decode(encodedMap!);
    setState(() {
      pin=user['pincode'];
    });

    print(user['pin']);
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0,vertical:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

           Padding(
             padding: const EdgeInsets.only(top: 18.0),
             child: Align(
               alignment: Alignment.topRight,
               child:   GestureDetector(
                 onTap: () {
                   Navigator.pop(context);
                 },
                 child: Container(
                   padding: const EdgeInsets.all(5.0),
                   decoration: const BoxDecoration(
                       shape: BoxShape.circle, color: Colors.white),
                   child: Icon(
                     Icons.clear,
                     size:36,
                     color: secondryColor,
                   ),
                 ),
               ),
             ),
           ),

            Column(
              children: [
                Text("$pin",style:TextStyle(fontWeight:FontWeight.w700,
                    color:Colors.black54,fontSize:height*0.1,letterSpacing:30),),
SizedBox(height:50,),
Text("This is your card's PIN",style:TextStyle(fontWeight:FontWeight.w700,
    color:Colors.black45,fontSize:height*0.024)),
                SizedBox(height:20,),
                Text("You can come back here to check your PIN at any time. If you wish to change your PIN. you can do so at any ATM",style:TextStyle(fontWeight:FontWeight.w700,
                    color:Colors.black54,fontSize:height*0.025),textAlign:TextAlign.center,),
                SizedBox(height:height*0.2,),
                SizedBox(
                    height: height * 0.067,
                    width: width,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.pushReplacement(
                          //     context,
                          //     new MaterialPageRoute(
                          //         builder: (context) =>
                          //             MyHomePage()));
                        },
                        child: const Text(
                          "Got it",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        ))),

              ],
            )



          ],
        ),
      ),
    );
  }
}
