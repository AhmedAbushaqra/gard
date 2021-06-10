import 'package:flutter/cupertino.dart';

//[branchid,date,chain,branch,catename,subcatename,itemname,capacity,faces]

class dbCompOfferCate {
  String id;
  String branchid;
  String catename;
  String company;

  dbCompOfferCate({
    this.id,
    this.branchid,
    this.catename,
    this.company,
  });

  factory dbCompOfferCate.fromJson(dynamic obj) {
    return dbCompOfferCate(
      id: obj['id'],
      branchid:  obj['branchid'].toString(),
      catename: obj['catename'].toString(),
      company: obj['company'].toString(),
    );
  }

  dbCompOfferCate.fromMap(Map<String, dynamic> data){
    id = data['id'];
    branchid = data['branchid'];
    catename=data['catename'];
    company=data['company'];
  }
  Map<String, dynamic> toMap() => {'id' : id, 'branchid': branchid,'catename':catename,'company':company};
}