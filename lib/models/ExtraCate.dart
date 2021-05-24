import 'package:flutter/cupertino.dart';

//[branchid,date,chain,branch,catename,subcatename,itemname,capacity,faces]

class ExtraCate {
  final String id;
  final String extraName;

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

  Map toJson() => {
    'id': id,
    'extraName': extraName,
  };
}