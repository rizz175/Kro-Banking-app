import 'package:flutter/material.dart';
import 'package:kro/constants.dart';
import 'package:share_plus/share_plus.dart';

class accountDetails extends StatefulWidget {
var user;

accountDetails(this.user);

  @override
  _accountDetailsState createState() => _accountDetailsState();
}

class _accountDetailsState extends State<accountDetails> {

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
  Extra e=Extra();
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
                    "Your Account",
                    style: TextStyle(
                        fontSize: height * 0.025, fontWeight: FontWeight.w600,letterSpacing:1),
                  ),
                  Text("          "),
                ],
              ),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Account Details",
                            style: TextStyle(
                                fontSize: height * 0.028,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45),
                          ),
                          IconButton(
                              onPressed: () {
                                Share.share('Account Number : ${widget.user['accountno']}');

                              },
                              icon: Icon(
                                Icons.ios_share,
                                color: secondryColor,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Name"),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${widget.user['name']}",
                        style: TextStyle(
                            color: secondryColor,
                            letterSpacing: 1,
                            fontSize: height * 0.029),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Account No."),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${widget.user['accountno']}",
                        style: TextStyle(
                            color: secondryColor,
                            letterSpacing: 1,
                            fontSize: height * 0.029),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text("Sort Code"),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        _addDashes(widget.user['sortcode']),
                        style: TextStyle(
                            color: secondryColor,
                            letterSpacing: 1,
                            fontSize: height * 0.029),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
