import 'package:flutter/cupertino.dart';

class Product {
  final String imgUrl;
  final String name;
  final String category;
  final String subCategory;
  final int quantity;
  DateTime date;

  Product(
      { this.imgUrl,
      this.name,
      this.category,
      this.subCategory,
      this.quantity,
      this.date});

  List<Product> productList = [];
}
