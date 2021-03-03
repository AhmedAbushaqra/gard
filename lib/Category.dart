import 'package:flutter/material.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:provider/provider.dart';
import 'CategoryListShape.dart';

class Category extends StatelessWidget {
  static const RouteName = "/selectItem";
  @override
  Widget build(BuildContext context) {
    final categoryData=Provider.of<Chains>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: categoryData.Category.length,
          itemBuilder: (ctx,i)=>CategoryListShape(categoryData.Category[i]['cateName'],categoryData.Category[i]['cateImage'],),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
