import 'package:flutter/material.dart';
import 'package:gard/Category.dart';
import 'package:gard/models/chainModel.dart';

class ListViewItem extends StatelessWidget {
  final String id;
  final String BranchName;
  final String imgUrl;

  ListViewItem(this.id,this.BranchName,this.imgUrl);
  List<Chain> chainList = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(BranchName),
          leading: CircleAvatar(maxRadius: 55,backgroundImage: NetworkImage(imgUrl),),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios,),
            onPressed: (){
              Navigator.of(context).pushNamed(Category.RouteName);
            },
          ),
        ),
        Divider(),
      ],
    );
  }
}
