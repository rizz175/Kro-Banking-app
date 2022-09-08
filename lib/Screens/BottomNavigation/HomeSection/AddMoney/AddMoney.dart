import 'package:flutter/material.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/AddMoney/ChooseAmount.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/PinDetails.dart';
import 'package:kro/constants.dart';

class addMoney extends StatefulWidget {
  const addMoney({Key? key}) : super(key: key);

  @override
  _addMoneyState createState() => _addMoneyState();
}

class _addMoneyState extends State<addMoney> {

  bool freezit=false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
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
                    "Add Money",
                    style: TextStyle(
                        fontSize: height * 0.025, fontWeight: FontWeight.w600,letterSpacing:1),
                  ),
                  const Text("          "),
                ],
              ),
              const SizedBox(height:20,),



              Container(
                margin: const EdgeInsets.only(left: 0, top: 20, right: 0),
                padding: const EdgeInsets.only(left: 0, top: 20,bottom:20),
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
                    children: [
                   Image.asset("assets/bank.png"),
                      const SizedBox(height:20,),
                      Text("Instant Bank Transfer",style:TextStyle(fontSize: height*0.03,letterSpacing:0.5,fontWeight:FontWeight.w800,color:secondryColor),)
                      ,const SizedBox(height:20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:18.0),
                        child: Text("Add money securely in less than a minute without entering your account details",style:TextStyle(fontSize: height*0.03,letterSpacing:0.5,fontWeight:FontWeight.w400),textAlign:TextAlign.center,),
                      )
                     ,const SizedBox(height:20,), Container(
                        height:height*0.05,
                        width:width*0.5,


                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary:secondryColor),
                          onPressed:(){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const chooseAmount()));
                          },
                          child:Text(
                            "Add money now",
                            style: TextStyle(color:Colors.white, fontSize:height*0.025),
                          ),
                        ),
                      )
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
