import 'package:flutter/material.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/PinDetails.dart';
import 'package:kro/constants.dart';

class chooseBank extends StatefulWidget {
  const chooseBank({Key? key}) : super(key: key);

  @override
  _chooseBankState createState() => _chooseBankState();
}

class _chooseBankState extends State<chooseBank> {

  double balance=0.04;
  bool freezit=false;
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
                          "Choose your bank",
                          style: TextStyle(
                              fontSize: height * 0.025, fontWeight: FontWeight.w600,letterSpacing:1),
                        ),
                        Text("          "),
                      ],
                    ),
                    SizedBox(height:30,),
                    Text("We 'll automatically send to your selected bank and then securely bring your back",style:TextStyle(
                        fontWeight:FontWeight.w400,color:Colors.black87,
                        fontSize: height*0.025
                    )),

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
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Text(
                              "Banks",
                              style: TextStyle(
                                  fontSize: height * 0.028,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45),
                            ),SizedBox(height:20,),
                            ListTile(
                                onTap:(){
                                  Navigator.pop(context,"Kroo Bank");
                                },
               minVerticalPadding:10,
                                horizontalTitleGap:10,
                                dense:true,
                                leading: Container(
                                  height:height*0.045,
                                  width:35,

                                  decoration: BoxDecoration(
                                      color:primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(Icons.account_balance,color:Colors.white,size:height*0.030
                                    ,),
                                ),
                                title:Text("Kroo Bank",  style: TextStyle(
                                    fontSize: height * 0.024,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87)),
                                trailing:Icon(Icons.arrow_forward_ios,size:18,color:secondryColor,)),
                            SizedBox(height:20,),
                            ListTile(
                              onTap:(){
                                Navigator.pop(context,"England Bank");
                              },
                                minVerticalPadding:10,
                                horizontalTitleGap:10,
                                dense:true,
                                leading: Container(
                                  height:height*0.045,
                                  width:35,

                                  decoration: BoxDecoration(
                                      color:primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Icon(Icons.account_balance,color:Colors.white,size:height*0.030
                                    ,),
                                ),
                                title:Text("England Bank",  style: TextStyle(
                                    fontSize: height * 0.024,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87)),
                                trailing:Icon(Icons.arrow_forward_ios,size:18,color:secondryColor,)),


                          ],
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
