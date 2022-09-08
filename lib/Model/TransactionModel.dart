import '../Helper/dbHelper.dart';

class TransactionModel {
  String? id;
  String? status;
  String? amount;
  String? date;
  String? r_sortcode;
  String? s_sortcode;
  String? r_accountno;
  String? s_accountno;
  String? r_id;
  String? r_name;
  String? s_id;
  String? s_name;
  String? reference;

  TransactionModel(
      this.id,
      this.status,
      this.amount,
      this.date,
      this.r_sortcode,
      this.s_sortcode,
      this.r_accountno,
      this.s_accountno,
      this.r_id,
      this.r_name,
      this.s_id,
      this.s_name,this.reference);

  TransactionModel.fromMap(Map<String, dynamic> map) {
    id = map['id'].toString();
    status = map['status'];

    amount = map['amount'];
    date = map['date'];
    r_sortcode = map['r_sortcode'];
    s_sortcode = map['s_sortcode'];
    r_accountno = map['r_accountno'];
    s_accountno = map['s_accountno'];
    r_id = map['r_id'].toString();
    s_id = map['s_id'].toString();
    s_name = map['s_name'];
    r_name = map['r_name'];
    reference=map['reference'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
      'amount': amount,
      'date': date,
      'r_sortcode': r_sortcode,
      's_sortcode': s_sortcode,
      'r_accountno': r_accountno,
      's_accountno': s_accountno,
      'r_id': r_id,
      's_id': s_id,
      's_name': s_name,
      'r_name': r_name,
      'reference':reference
    };
  }
}
