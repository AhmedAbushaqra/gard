import 'package:flutter/cupertino.dart';

class Catesend {
  int id;
  String branchid;
  String cate;

  Catesend({
    this.id,
    this.branchid,
    this.cate
  });

  factory Catesend.fromJson(dynamic obj) {
    return Catesend(
      id: obj['id'],
      branchid: obj['branchid'].toString(),
      cate: obj['catename'].toString(),
    );
  }

  Catesend.fromMap(Map<String, dynamic> data){
    id = data['id'];
    branchid=data['branchid'];
    cate = data['catename'];
  }
  Map<String, dynamic> toMap() => {'id' : id,'branchid':branchid , 'catename': cate,};
}