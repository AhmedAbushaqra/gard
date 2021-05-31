import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class empLogin with ChangeNotifier{
  final String id;
  final String empid;
  final String empname;
  final String location;
  final String branchid;
  final String branchname;

  empLogin({
    @required this.id,
    @required this.empid,
    @required this.empname,
    @required this.location,
    @required this.branchid,
    @required this.branchname,
  });
}