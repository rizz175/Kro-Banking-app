import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
class transactionDetail extends StatefulWidget {
var translist;

transactionDetail(this.translist);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<transactionDetail> {
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
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  height: height * 0.26,
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
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

                      ],
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 20, top:height*0.2 , right: 20),
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                 "To ${ widget.translist.r_name}",
                                  style: TextStyle(

                                      fontSize: height * 0.02,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: .5),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.translist.date,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: height * 0.014,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: .5),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children:  [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Settled",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: height * 0.020,

                                      letterSpacing: .5),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "\£ ${double.parse(widget.translist.amount).toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: height * 0.02,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .5),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
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
                    "Transaction details",
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
                      Text("Payment type ",
                          style: TextStyle(
                              fontSize: height * 0.024,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                      Text("Bank Transfer ",
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
                      Text("Currency  ",
                          style: TextStyle(
                              fontSize: height * 0.024,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                      Text("GBP ",
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
                      Text("${_addDashes(widget.translist.r_sortcode)} ",
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
                      Text("Account number  ",
                          style: TextStyle(
                              fontSize: height * 0.024,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                      Text(widget.translist.r_accountno,
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
                      Text("Status ",
                          style: TextStyle(
                              fontSize: height * 0.024,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                      Text("Settled",
                          style: TextStyle(
                              fontSize: height * 0.026,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w300,
                              color: Colors.green))
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
                      Text("${widget.translist.reference}",
                          style: TextStyle(
                              fontSize: height * 0.026,

                              ))
                    ],
                  ),
                ],
              ),
            ),
          ),
SizedBox(height:20,),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Column(
              children: [
                Text(
                  "Transaction ID:",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: height * 0.025,

                      letterSpacing: .5),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  _addDashes(widget.translist.id),
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .5),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
