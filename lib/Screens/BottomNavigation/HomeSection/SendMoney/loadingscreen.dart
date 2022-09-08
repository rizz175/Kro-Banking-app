import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kro/Model/TransactionModel.dart';
import 'package:kro/Screens/BottomNavigation/HomeSection/SendMoney/PaymentSuccess.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Helper/dbHelper.dart';
import '../../../../Model/userModel.dart';


class loadingscreen extends StatefulWidget {

  var member;
  String balance;
  String date;
  String reference;

  loadingscreen(this.member, this.balance, this.date,this.reference);

  @override
  _loadingscreenState createState() => _loadingscreenState();
}

class _loadingscreenState extends State<loadingscreen> {
  SharedPreferences? prefs;
  var user;
  List<UserModel> userdata = [];
  final dbHelper = DatabaseHelper.instance;
  double balance=0;
  getuserData()
  async
  {
    prefs = await SharedPreferences.getInstance();


    String? encodedMap = await prefs!.getString('userdata');
    user= json.decode(encodedMap!);
    setState(() {

      String email=user['email'];
      _getdata(email);
    });

    print(user['name']);
  }
  void _getdata(String email) async {

    final allRows = await dbHelper.getBalance(email);
    userdata.clear();
    allRows.forEach((row) => userdata.add(UserModel.fromMap(row)));
    if(userdata.length>0)
    {

      setState(() {
        balance=double.parse(userdata[0].balance.toString());
      });
      print("My Balance"+userdata[0].balance.toString());

    }

    print("User data"+userdata.length.toString());
    _insert();

  }
  Future<void> updateBalance()
  async {
    double total=balance-double.parse(widget.balance);
    print("total"+total.toString());
    final res = await dbHelper.updateBalance(userdata[0].id,total);
    print(res);


  }
  void _insert() async {
    var id = 1000000000+ Random().nextInt(1111111111 - 1000000000);
     print("id$id");
    Map<String, dynamic> row = {
      'id': id.toString(),
      'status':"Done",
      'amount':widget.balance,
      'date':widget.date,
      'r_sortcode':widget.member.sortcode,
      's_sortcode': userdata[0].sortcode,
      'r_accountno':widget.member.accountno,
      's_accountno':userdata[0].accountno,
      'r_id': widget.member.id,
      's_id':userdata[0].id,
      'r_name':"${widget.member.name} ${widget.member.surname}",
      's_name':userdata[0].name,
      'reference':widget.reference
    };
    TransactionModel tr=TransactionModel.fromMap(row);
    print(tr.toMap().toString());
    try {
      final id = await dbHelper.inserttransaction(tr);
updateBalance();
    }catch(e){
      print(e.toString());
    }

  }
  @override
  void initState() {

getuserData();
    print(widget.member.toString());
    print(widget.balance.toString());
    print(widget.date);
    print(widget.reference);


    Future.delayed(const Duration(seconds:5), () {

      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (context) =>PaymentSuccess(widget.member,widget.date,widget.balance)));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor:Colors.white,
      body:Center(

        child:Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical:40),
              child: Image.asset("assets/loading.gif"),
            )),
      ),
    );
  }


}
