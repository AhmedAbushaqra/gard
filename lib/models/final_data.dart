import 'package:flutter/cupertino.dart';

//branchid,date,chain,branch,itemid,catename,subcatename,itemname,price,faces

class FinalData {
  final String branchid;
  final String date;
  final String chain;
  final String branch;
  final String itemid;
  final String catename;
  final String subcatename;
  final String itemname;
  final String price;
  final String faces;

  FinalData({
    this.branchid,
    this.date,
    this.chain,
    this.branch,
    this.itemid,
    this.catename,
    this.subcatename,
    this.itemname,
    this.price,
    this.faces,
  });

  factory FinalData.fromJson(dynamic json) {
    return FinalData(
      branchid: json['branchid'],
      date: json['date'],
      chain: json['chain'],
      branch: json['branch'],
      itemid: json['itemid'],
      catename: json['catename'],
      subcatename: json['subcatename'],
      itemname: json['itemname'],
      price: json['price'],
      faces: json['faces'],
    );
  }

  Map toJson() => {
        'branchid': branchid,
        'date': date,
        'chain': chain,
        'branch': branch,
        'itemid': itemid,
        'catename': catename,
        'subcatename': subcatename,
        'itemname': itemname,
        'price': price,
        'faces': faces,
      };
}
