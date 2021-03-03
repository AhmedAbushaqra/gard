import 'package:flutter/cupertino.dart';

class Chain {
  final String id;
  final String chain;
  final String branch;
  final String imgUrl;

  Chain({this.id,
    this.chain,
    this.branch,
    this.imgUrl,
  });

  factory Chain.fromJson(dynamic json) {
    return Chain(
      id: json['id'],
      chain: json['chain'],
      branch: json['branch']
      // "${json['id']}",
      // "${json['chain']}",
      // "${json['branch']}",
    );
  }

  Map toJson() => {
        'id': id,
        'chain': chain,
        'branch': branch,
      };
}
