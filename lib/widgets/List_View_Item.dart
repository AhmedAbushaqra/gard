import 'package:flutter/material.dart';
import 'package:gard/Category.dart';
import 'package:gard/models/chainModel.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:provider/provider.dart';

class ListViewItem extends StatelessWidget {
  final String id;
  final String BranchName;
  final String imgUrl;

  ListViewItem(this.id,this.BranchName,this.imgUrl);
 // List<Chain> chainList = [];
  @override
  Widget build(BuildContext context) {
    final chainData=Provider.of<Chains>(context);
    return Column(
      children: [
        Divider(),
        ListTile(
          title: Text(BranchName),
          onTap: (){
            chainData.id=id;
            chainData.selectedBranch=BranchName;
            Navigator.of(context).pushNamed(Category.RouteName);
          },
          leading: CircleAvatar(backgroundImage: AssetImage(imgUrl),maxRadius: 55,),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios,),
            onPressed: (){
              chainData.id=id;
              chainData.selectedBranch=BranchName;
              Navigator.of(context).pushNamed(Category.RouteName);
            },
          ),
        ),
      ],
    );
  }
}
