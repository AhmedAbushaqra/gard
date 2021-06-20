import 'package:flutter/cupertino.dart';

//[branchid,date,chain,branch,catename,subcatename,itemname,capacity,faces]

class dbOurMainPrice {
  String id;
  String branchid;
  String ItemName;
  String pricecatename;
  String price;
  String size;

  dbOurMainPrice({
    this.id,
    this.branchid,
    this.ItemName,
    this.pricecatename,
    this.price,
    this.size,
  });

  factory dbOurMainPrice.fromJson(dynamic obj) {
    return dbOurMainPrice(
      id: obj['id'],
      branchid: obj['branchid'],
      ItemName: obj['ItemName'].toString(),
      pricecatename: obj['pricecatename'].toString(),
      price: obj['price'].toString(),
      size: obj['size'].toString(),
    );
  }

  dbOurMainPrice.fromMap(Map<String, dynamic> data){
    id = data['id'];
    branchid=data['branchid'];
    ItemName =data['ItemName'];
    pricecatename=data['pricecatename'];
    price=data['price'];
    size=data['size'];
  }
  Map<String, dynamic> toMap() => {'id' : id,'branchid':branchid ,'ItemName':ItemName,'pricecatename':pricecatename,'price':price,'size':size,};
}