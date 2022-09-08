import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kro/constants.dart';

class accountLimits extends StatefulWidget {
  const accountLimits({Key? key}) : super(key: key);

  @override
  _accountLimitsState createState() => _accountLimitsState();
}

class _accountLimitsState extends State<accountLimits> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
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
                      "Account Limits",
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
                        Text(
                          "Adding Money",
                          style: TextStyle(
                              fontSize: height * 0.028,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ListTile(

                          horizontalTitleGap:10,
                          dense:true,
                          leading: Container(
                            height:height*0.055,
                            width:45,

                            decoration: BoxDecoration(
                                color:Colors.lightGreen,
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(Icons.account_balance,color:Colors.white,size:height*0.030
                              ,),
                          ),
                          title:Text("Bank Transfer",  style: TextStyle(
                              fontSize: height * 0.027,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                          subtitle:Text("\£2000 only",style: TextStyle(
                              fontSize: height * 0.023,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45)),


                        )

                      ],
                    ),
                  ),
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
                        Text(
                          "Sending Money",
                          style: TextStyle(
                              fontSize: height * 0.028,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ListTile(

                          horizontalTitleGap:10,
                          dense:true,
                          leading: Container(
                            height:height*0.055,
                            width:45,

                            decoration: BoxDecoration(
                                color:primaryColor.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(Icons.account_balance,color:Colors.white,size:height*0.030
                              ,),
                          ),
                          title:Text("Bank Transfer",  style: TextStyle(
                              fontSize: height * 0.027,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                          subtitle:Text("\£1000 only",style: TextStyle(
                              fontSize: height * 0.023,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45)),


                        )

                      ],
                    ),
                  ),
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
                        Text(
                          "Using your card",
                          style: TextStyle(
                              fontSize: height * 0.028,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ListTile(

                          horizontalTitleGap:10,
                          dense:true,
                          leading: Container(
                            height:height*0.055,
                            width:45,

                            decoration: BoxDecoration(
                                color:Colors.cyan.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(Icons.print,color:Colors.white,size:height*0.030
                              ,),
                          ),
                          title:Text("ATM Withdrawls",  style: TextStyle(
                              fontSize: height * 0.027,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                          subtitle:Text("\£250 only",style: TextStyle(
                              fontSize: height * 0.023,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45)),


                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        ListTile(

                          horizontalTitleGap:10,
                          dense:true,
                          leading: Container(
                            height:height*0.055,
                            width:45,

                            decoration: BoxDecoration(
                                color:Colors.cyan.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(Icons.credit_card,color:Colors.white,size:height*0.030
                              ,),
                          ),
                          title:Text("Spending Limits",  style: TextStyle(
                              fontSize: height * 0.027,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                          subtitle:Text("\£250 only",style: TextStyle(
                              fontSize: height * 0.023,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45)),


                        )

                      ],
                    ),
                  ),
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
                        Text(
                          "Spending Overseas",
                          style: TextStyle(
                              fontSize: height * 0.028,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ListTile(

                          horizontalTitleGap:10,
                          dense:true,
                          leading: Container(
                            height:height*0.055,
                            width:45,

                            decoration: BoxDecoration(
                                color:Colors.red.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(Icons.print,color:Colors.white,size:height*0.030
                              ,),
                          ),
                          title:Text("Foreign ATM Withdrawls",  style: TextStyle(
                              fontSize: height * 0.027,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                          subtitle:Text("\£250 daily with no fees ",style: TextStyle(
                              fontSize: height * 0.023,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45)),


                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        ListTile(

                          horizontalTitleGap:10,
                          dense:true,
                          leading: Container(
                            height:height*0.055,
                            width:45,

                            decoration: BoxDecoration(
                                color:Colors.red.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(Icons.currency_pound,color:Colors.white,size:height*0.030
                              ,),
                          ),
                          title:Text("Card transactions",  style: TextStyle(
                              fontSize: height * 0.027,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                          subtitle:Text("Spend in over 140 currencies with no fees",style: TextStyle(
                              fontSize: height * 0.022,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45)),


                        )

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
