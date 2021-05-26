import 'package:flutter/cupertino.dart';

//[branchid,date,chain,branch,catename,subcatename,itemname,capacity,faces]

class ExtraCate {
  String id;
  String extraName;

  ExtraCate({
    this.id,
    this.extraName,
  });

  factory ExtraCate.fromJson(dynamic json) {
    return ExtraCate(
      id: json['id'].toString(),
      extraName: json['extraName'].toString(),
    );
  }

  ExtraCate.fromMap(Map<String, dynamic> data){
    id = data['id'];
    extraName = data['extraName'];
  }
  Map<String, dynamic> toMap() => {'id' : id, 'extraName': extraName,};
}