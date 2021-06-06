import 'package:flutter/cupertino.dart';

//[branchid,date,chain,branch,catename,subcatename,itemname,capacity,faces]

class dbOurOfferCate {
  String id;
  String branchid;
  String chain;
  String branch;
  String itemnum;
  String catename;
  String subcate;
  String subBrand;
  String ItemName;

  dbOurOfferCate({
    this.id,
    this.branchid,
    this.chain,
    this.branch,
    this.itemnum,
    this.catename,
    this.subcate,
    this.subBrand,
    this.ItemName,
  });

  factory dbOurOfferCate.fromJson(dynamic obj) {
    return dbOurOfferCate(
      id: obj['id'],
      branchid:  obj['branchid'].toString(),
      chain: obj['chain'].toString(),
      branch: obj['branch'].toString(),
      itemnum: obj['itemnum'].toString(),
      catename: obj['catename'].toString(),
      subcate: obj['subcate'].toString(),
      subBrand: obj['subbrand'].toString(),
      ItemName: obj['ItemName'].toString(),
    );
  }

  dbOurOfferCate.fromMap(Map<String, dynamic> data){
    id = data['id'];
    branchid = data['branchid'];
    chain = data['chain'];
    branch=data['branch'];
    itemnum =data['itemnum'];
    catename=data['catename'];
    subcate=data['subcate'];
    subBrand=data['subbrand'];
    ItemName=data['ItemName'];
  }
  Map<String, dynamic> toMap() => {'id' : id, 'branchid': branchid,'chain': chain, 'branch':branch, 'itemnum':itemnum
                                 ,'catename':catename,'subcate':subcate,'subbrand':subBrand,'ItemName':ItemName,};
}