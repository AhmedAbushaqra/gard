import 'package:flutter/cupertino.dart';

//[branchid,date,chain,branch,catename,subcatename,itemname,capacity,faces]

class ExpiryData {
  final String branchid;
  final String chain;
  final String branch;
  final String itemnum;
  final String catename;
  final String subcatename;
  final String itemname;
  final String count;
  final String itemtype;
  final String expirydate;

  ExpiryData({
    this.branchid,
    this.chain,
    this.branch,
    this.itemnum,
    this.catename,
    this.subcatename,
    this.itemname,
    this.count,
    this.itemtype,
    this.expirydate,
  });

  factory ExpiryData.fromJson(dynamic json) {
    return ExpiryData(
      //[branchid,chain,branch,itemnum,catename,subcatename,itemname,count,itemtype,expirydate]);
      branchid: json['branchid'],
      chain: json['chain'],
      branch: json['branch'],
      itemnum: json['itemnum'],
      catename: json['catename'],
      subcatename: json['subcatename'],
      itemname: json['itemname'],
      count: json['count'],
      itemtype: json['itemtype'],
      expirydate: json['expirydate'],
    );
  }

  Map toJson() => {
    'branchid': branchid,
    'chain': chain,
    'branch': branch,
    'itemnum':itemnum,
    'catename': catename,
    'subcatename': subcatename,
    'itemname': itemname,
    'count': count,
    'itemtype':itemtype,
    'expirydate':expirydate,
  };
}