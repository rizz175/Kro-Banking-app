import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/PinDetails.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/AddMoney/SelectBank.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/AddMoney/successAdded.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/SendMoney/PaymentSuccess.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/SendMoney/loadingscreen.dart';
import 'package:kro/constants.dart';

class ReviewScreen extends StatefulWidget {
var member;
String reference;
String balance;

ReviewScreen(this.member,this.reference,this.balance);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  String date="";


  bool freezit=false;
  String _addDashes(String text) {
    const int addDashEvery = 2;
    String out = '';

    for (int i = 0; i < text.length; i++) {
      if (i + 1 > 2 && i % 2 == 0) {
        out += '-';
      }

      out += text[i];
    }

    return out;
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
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
                          "Review Bank Transfer",
                          style: TextStyle(
                              fontSize: height * 0.025, fontWeight: FontWeight.w600,letterSpacing:1),
                        ),
                        Text("          "),
                      ],
                    ),
                    SizedBox(height:20,),
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
                        const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sender details",
                              style: TextStyle(
                                  fontSize: height * 0.027,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Name ",
                                    style: TextStyle(
                                        fontSize: height * 0.024,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87)),
                                Text("${widget.member.name}",
                                    style: TextStyle(
                                        fontSize: height * 0.026,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black87))
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sort Code  ",
                                    style: TextStyle(
                                        fontSize: height * 0.024,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87)),
                                Text("${_addDashes(widget.member.sortcode)} ",
                                    style: TextStyle(
                                        fontSize: height * 0.026,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black87))
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Account Number ",
                                    style: TextStyle(
                                        fontSize: height * 0.024,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87)),
                                Text("${widget.member.accountno} ",
                                    style: TextStyle(
                                        fontSize: height * 0.026,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w300,
                                        ))
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Amount ",
                                    style: TextStyle(
                                        fontSize: height * 0.024,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87)),
                                Text("\£${double.parse(widget.balance).toStringAsFixed(2)} ",
                                    style: TextStyle(
                                      fontSize: height * 0.026,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w300,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Reference ",
                                    style: TextStyle(
                                        fontSize: height * 0.024,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87)),
                                Text("${widget.reference} ",
                                    style: TextStyle(
                                      fontSize: height * 0.026,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w300,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Date ",
                                    style: TextStyle(
                                        fontSize: height * 0.024,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87)),
                                Text("${date} ",
                                    style: TextStyle(
                                      fontSize: height * 0.026,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w300,
                                    ))
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),



                  ],
                ),

                Column(
                  children: [

                    SizedBox(height:20,), Container(
                      height:height*0.07,
                      width:width,


                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary:secondryColor),
                        onPressed:(){
                          Navigator.pushReplacement(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      loadingscreen(widget.member,widget.balance,date,widget.reference)));
                        },
                        child:Text(
                          "Confirm & Send",
                          style: TextStyle(color:Colors.white, fontSize:height*0.029),
                        ),
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    date = DateFormat("MMMM, dd, yyyy").format(DateTime.now());
    print(date);

  }
}
