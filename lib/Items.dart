import 'package:flutter/material.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/List_View_Item_Items.dart';
import 'package:provider/provider.dart';

class Items extends StatelessWidget {
  static const RouteName = "/Item";
  @override
  Widget build(BuildContext context) {
    final ItemData=Provider.of<Chains>(context);
    return Scaffold(
      body:ListView.builder(
        itemBuilder: (ctx,index)=>ItemsListView(
          ItemData.subCategory[index]['id'],
          ItemData.subCategory[index]['Itemname'],
          ItemData.subCategory[index]['imgUrl'],
          ItemData.subCategory[index]['SubCate'],
        ),
        itemCount: ItemData.subCategory.length,
      ),
    );
  }
}
