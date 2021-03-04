import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gard/Items.dart';
import 'package:gard/models/product.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:provider/provider.dart';

import 'models/chainModel.dart';

class CategoryListShape extends StatelessWidget {
  final String name;
  final String imgUrl;

  CategoryListShape(this.name,this.imgUrl,);
  List<Chain> CategoryList = [];

  @override
  Widget build(BuildContext context) {
    final catagoryData=Provider.of<Chains>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child:GestureDetector(
        onTap: (){
          CategoryList = [
            Chain(
              chain: name,
              imgUrl: imgUrl,
            )
          ];
          catagoryData.selectedCategory=name;
          catagoryData.onChangedSecondCallback(name);
          Navigator.of(context).pushNamed(Items.RouteName);
        },
        child: GridTile(
          child: Image.asset(imgUrl,fit: BoxFit.fill,),
          // header: ,
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              name,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
