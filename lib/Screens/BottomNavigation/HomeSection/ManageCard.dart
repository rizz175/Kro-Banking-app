import 'package:flutter/material.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/PinDetails.dart';
import 'package:kro/constants.dart';

class manageCard extends StatefulWidget {
  const manageCard({Key? key}) : super(key: key);

  @override
  _manageCardState createState() => _manageCardState();
}

class _manageCardState extends State<manageCard> {

  bool freezit=false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Icon(
                        Icons.arrow_back,
                        color: secondryColor,
                      ),
                    ),
                  ),
                  Text(
                    "Manage your card",
                    style: TextStyle(
                        fontSize: height * 0.025, fontWeight: FontWeight.w600,letterSpacing:1),
                  ),
                  Text("          "),
                ],
              ),
              SizedBox(height:40,),
              Container(
                  height:height*0.4,
                  width:width*0.5,

                  child: Image.asset("assets/cardpng.png",fit:BoxFit.cover,)),
              
              
              Container(
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
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.severe_cold,
                                color: Colors.black54,
                                size: height * 0.04,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text("Freeza card ",
                                      style: TextStyle(
                                          fontSize: height * 0.024,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87)),
                                  Text("Block future card transactions")
                                ],
                              ),
                            ],
                          ),
                          Switch(value:freezit, onChanged:(fal){

                            setState(() {

                              freezit=fal;
                            });
                          },activeColor:secondryColor,)
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),

                      GestureDetector(

                        onTap:(){
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      pinDetails()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.lock,
                                  color: Colors.black54,
                                  size: height * 0.04,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("View Pin ",
                                    style: TextStyle(
                                        fontSize: height * 0.024,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87)),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black54,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
