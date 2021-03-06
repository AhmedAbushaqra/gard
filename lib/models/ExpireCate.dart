import 'package:flutter/cupertino.dart';

//[branchid,date,chain,branch,catename,subcatename,itemname,capacity,faces]

class ExpireCate {
  String id;
  String itemnum;
  String branchid;
  String catename;
  String subcate;
  String expireName;

  ExpireCate({
    this.id,
    this.itemnum,
    this.branchid,
    this.catename,
    this.expireName,
    this.subcate,
  });

  factory ExpireCate.fromJson(dynamic json) {
    return ExpireCate(
      id: json['id'].toString(),
      itemnum: json['itemnum'].toString(),
      branchid: json['branchid'],
      catename: json['catename'],
      subcate: json['subcate'].toString(),
      expireName: json['expireName'].toString(),
    );
  }

  ExpireCate.fromMap(Map<String, dynamic> data){
    id = data['id'];
    itemnum=data['itemnum'];
    branchid=data['branchid'];
    catename=data['catename'];
    subcate=data['subcate'];
    expireName = data['expireName'];
  }
  Map<String, dynamic> toMap() => {'id' : id,'itemnum':itemnum , 'branchid':branchid ,'catename':catename,'subcate':subcate, 'expireName': expireName,};
}