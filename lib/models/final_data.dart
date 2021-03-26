import 'package:flutter/cupertino.dart';

//[branchid,date,chain,branch,catename,subcatename,itemname,capacity,faces]

class FinalData {
  final String branchid;
  final String date;
  final String chain;
  final String branch;
  final String catename;
  final String subcatename;
  final String itemname;
  final String capacity;
  final String faces;

  FinalData({
    this.branchid,
    this.date,
    this.chain,
    this.branch,
    this.catename,
    this.subcatename,
    this.itemname,
    this.capacity,
    this.faces,
  });

  factory FinalData.fromJson(dynamic json) {
    return FinalData(
      branchid: json['branchid'].toString(),
      date: json['date'].toString(),
      chain: json['chain'],
      branch: json['branch'],
      catename: json['catename'],
      subcatename: json['subcatename'],
      itemname: json['itemname'],
      capacity: json['capacity'],
      faces: json['faces'].toString(),
    );
  }

  Map toJson() => {
        'branchid': branchid,
        'date': date,
        'chain': chain,
        'branch': branch,
        'catename': catename,
        'subcatename': subcatename,
        'itemname': itemname,
        'capacity': capacity,
        'faces': faces,
      };
}
