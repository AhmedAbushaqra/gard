import 'package:flutter/material.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/Category.dart';
import 'package:gard/widgets/List_View_Item.dart';
import 'package:provider/provider.dart';

class Branches extends StatelessWidget {
  static const RouteName = "/Category";
  @override
  Widget build(BuildContext context) {
    final chainData=Provider.of<Chains>(context);
    return Scaffold(
      body:ListView.builder(
          itemBuilder: (ctx,index)=>ListViewItem(
            chainData.branches[index]['id'],
            chainData.branches[index]['BranchName'],
            chainData.imgUrlSelectedPlace,
          ),
        itemCount: chainData.branches.length,
      ),
    );
  }
}