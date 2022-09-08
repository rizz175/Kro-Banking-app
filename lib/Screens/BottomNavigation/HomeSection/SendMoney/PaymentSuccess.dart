import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../constants.dart';

class PaymentSuccess extends StatefulWidget {
  var member;
  String balance;
  String date;

  PaymentSuccess(this.member,  this.date,this.balance,);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  bool done=false;




  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),

      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal:0.0,vertical:0),
        child: Column(
          children: [

            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                    clipper:MultipleRoundedCurveClipper(),
                    child: Container(
                      height:height*0.25,
                      color:primaryColor,

                    )),
                Positioned(
                  top:height*0.04,
                  right:16,
                  child: GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child:Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(
                            Icons.clear,
                            size:23,
                            color: secondryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top:height*0.1,
                  right:50,
                  left:50,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: AvatarGlow(animate:true,
                      glowColor:secondryColor,
                      endRadius:100.0,
                      duration: Duration(milliseconds: 2000),
                      repeat: true,
                      showTwoGlows: true,
                      repeatPauseDuration: Duration(milliseconds: 100),
                      child: Material(     // Replace this child with your own
                        elevation:7,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child:Icon(Icons.account_balance,size:50,color:secondryColor,),
                          radius:60.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:height*0.08,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Container(
                margin: const EdgeInsets.only(left: 0, top: 20, right: 0),
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.06),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical:40),
                  child: Column(

                    children: [
                      Text(
                        "\£${double.parse(widget.balance).toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: height * 0.05,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),textAlign: TextAlign.center,
                      ),
                      SizedBox(height:10,),
                      Text(
                        "Successfully Sent to\n ${widget.member.name}",
                        style: TextStyle(
                            fontSize: height * 0.03,
                            letterSpacing: 0.5,

                            color: Colors.black54),textAlign: TextAlign.center,
                      ),
                      SizedBox(height:30,),
                      ListTile(

                        horizontalTitleGap:10,
                        dense:true,
                        leading:Icon(Icons.lock,size:height*0.04,),
                        title:Text("Secure",  style: TextStyle(
                            fontSize: height * 0.026,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                        subtitle:Text("This process is end-to-end secure",  style: TextStyle(
                            fontSize: height * 0.020,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54)),



                      ),
                      SizedBox(height:10,),
                      ListTile(

                        horizontalTitleGap:10,
                        dense:true,
                        leading:Icon(Icons.perm_identity_rounded,size:height*0.04,),
                        title:Text("Private",  style: TextStyle(
                            fontSize: height * 0.025,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                        subtitle:Text("Your credentials will never be made accessible to anyone",  style: TextStyle(
                            fontSize: height * 0.02,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54)),



                      )

                    ],
                  ),
                ),
              ),
            )






          ],
        ),
      ),
    );
  }
}
