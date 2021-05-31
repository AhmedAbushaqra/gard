import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gard/ExpiryItem.dart';
import 'package:gard/Items.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/extra_vis_screen.dart';
import 'package:gard/models/product.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:provider/provider.dart';

import 'models/chainModel.dart';

class CategoryListShape extends StatelessWidget {
  final String name;
  final String imgUrl;

  CategoryListShape(this.name,this.imgUrl,);
  List<Chain> CategoryList = [];
  DbHelper helper=DbHelper();
  @override
  Widget build(BuildContext context) {
    final catagoryData=Provider.of<Chains>(context);
    String reportType=catagoryData.reportType;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child:GestureDetector(
        onTap: ()async{
          CategoryList = [
            Chain(
              chain: name,
              imgUrl: imgUrl,
            )
          ];
          catagoryData.selectedCategory=name;
          catagoryData.onChangedSecondCallback(name);
          reportType=='P.O.S'?Navigator.of(context).pushNamed(Items.RouteName)
              :reportType=='Extra Vis.'?Navigator.of(context).pushNamed(ExtraVisScreen.RouteName):
               Navigator.of(context).pushNamed(ExpireItems.RouteName);
          if(reportType=='Expire Report'){
            final tables = await helper.allExpireData();
            if(tables.isNotEmpty) {
              for (int i = 0; i < tables.length; i++) {
                catagoryData.AddExpireItemId(
                    tables[i]['id'].toString());
              }
            }
          }
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
