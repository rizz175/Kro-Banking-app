
import '../Helper/dbHelper.dart';

class UserModel {
  int? id;
  String? name;
  String? phone;
  String? password;
  String? email;
  String? accountno;
  String? balance;
  String? sortcode;
  String? pincode;
  String? address;


  UserModel(this.name, this.phone, this.password, this.email, this.accountno,
      this.balance, this.sortcode,this.pincode,this.address);

  UserModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    phone = map['phone'];
    password = map['password'];
    email = map['email'];
    accountno = map['accountno'];
    sortcode= map['sortcode'];
    balance = map['balance'];
    pincode = map['pincode'];
    address = map['address'];
  }

  Map<String, dynamic> toMap() {
    return {
    'id':id,
     'name':name,
   'phone':phone,
    'password':password,
    'email':email,
    'accountno':accountno,
    'sortcode':sortcode,
    'balance':balance,
      'pincode':pincode,
      'address':address

    };
  }
}