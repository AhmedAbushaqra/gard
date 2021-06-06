import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

//code,date,name,chain,branchid,branch,logintime
class empLogIn {
  final String code;
  final String date;
  final String name;
  final String chain;
  final String branchid;
  final String branch;
  final String logintime;

  empLogIn({
    this.code,
    this.date,
    this.name,
    this.chain,
    this.branchid,
    this.branch,
    this.logintime,
  });

  factory empLogIn.fromJson(dynamic json) {
    return empLogIn(
      code: json['code'].toString(),
      date: json['date'].toString(),
      name: json['name'].toString(),
      chain: json['chain'].toString(),
      branchid: json['branchid'].toString(),
      branch: json['branch'].toString(),
      logintime: json['logintime'].toString(),
    );
  }

  Map toJson() => {
    'code':code,
    'date': date,
    'name':name,
    'chain': chain,
    'branchid': branchid,
    'branch': branch,
    'logintime':logintime,
  };
}