import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:provider/provider.dart';

class ExpireItems extends StatefulWidget {
  static const RouteName = "/Expiry";
  @override
  _ExpireItemsState createState() => _ExpireItemsState();
}

class _ExpireItemsState extends State<ExpireItems> {
  var _expanded=false;
  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<Chains>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Card(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(itemData.selectedCategory),
                trailing: IconButton(
                    icon: Icon(_expanded?Icons.minimize:Icons.add),
                    onPressed:(){
                      setState(() {
                        _expanded=!_expanded;
                      });
                    }
                ),
              ),
              if(_expanded)
                Container(
                  //padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                  height: min(itemData.subCategory.length*40.0+10,380),
                  child: ListView.builder(
                    itemCount: itemData.subCategory.length,
                      itemBuilder: (ctx,index)=>Column(
                        children: [
                          Divider(),
                          ListTile(
                            title: Text(itemData.subCategory[index]['Itemname']),
                            trailing: IconButton(
                              icon: Icon(Icons.arrow_forward_ios),
                              onPressed: (){},
                            ),
                            onTap: (){},
                          ),
                        ],
                      ),
                      )
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
