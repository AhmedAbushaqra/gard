import 'package:flutter/cupertino.dart';

//[branchid,date,chain,branch,catename,subcatename,itemname,capacity,faces]

class ExtraCate {
  String id;
  String branchid;
  String extraName;

  ExtraCate({
    this.id,
    this.branchid,
    this.extraName,
  });

  factory ExtraCate.fromJson(dynamic json) {
    return ExtraCate(
      id: json['id'].toString(),
      branchid: json['branchid'],
      extraName: json['extraName'].toString(),
    );
  }

  ExtraCate.fromMap(Map<String, dynamic> data){
    id = data['id'];
    branchid=data['branchid'];
    extraName = data['extraName'];
  }
  Map<String, dynamic> toMap() => {'id' : id,'branchid':branchid , 'extraName': extraName,};
}