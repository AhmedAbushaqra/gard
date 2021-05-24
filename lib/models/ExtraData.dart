import 'package:flutter/cupertino.dart';

//[branchid,date,chain,branch,catename,subcatename,itemname,capacity,faces]

class ExtraData {
  final String branchid;
  final String date;
  final String chain;
  final String branch;
  final String type;
  final String capacity;
  final String faces;
  final String situation;
  final String condition;

  ExtraData({
    this.branchid,
    this.date,
    this.chain,
    this.branch,
    this.type,
    this.capacity,
    this.faces,
    this.situation,
    this.condition
  });

  factory ExtraData.fromJson(dynamic json) {
    return ExtraData(
      branchid: json['branchid'].toString(),
      date: json['date'].toString(),
      chain: json['chain'].toString(),
      branch: json['branch'].toString(),
      type: json['type'].toString(),
      capacity: json['capacity'].toString(),
      faces: json['faces'].toString(),
      situation: json['situation'].toString(),
      condition: json['condition'].toString(),
    );
  }

  Map toJson() => {
    'branchid': branchid,
    'date': date,
    'chain': chain,
    'branch': branch,
    'type': type,
    'capacity': capacity,
    'faces': faces,
    'situation': situation,
    'condition': condition,
  };
}