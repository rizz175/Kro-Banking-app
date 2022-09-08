
import '../Helper/dbHelper.dart';

class KroModel {
  int? id;
  String? name;
  String? surname;
  String? accountno;
  String? sortcode;
  String? senderid;


  KroModel(this.name, this.surname,this.accountno,
      this.senderid, this.sortcode);

  KroModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];

    accountno = map['accountno'];
    sortcode= map['sortcode'];
    surname = map['surname'];
    senderid = map['senderid'];

  }

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name':name,
      'senderid':senderid,
      'surname':surname,
      'accountno':accountno,
      'sortcode':sortcode,


    };
  }
}