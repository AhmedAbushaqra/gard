import 'package:flutter/cupertino.dart';

class Chain {
  final String id;
  final String chainName;
  final String branch;


  Chain(
      { this.id,
        this.chainName,
        this.branch,
        });
  String toParams() =>"?id=$id&chainName=$chainName&branch=$branch";
}
