import 'package:flutter/material.dart';
import 'package:gard/Category.dart';
import 'package:gard/OffersScreen.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/models/db_catesend.dart';
import 'package:gard/models/final_data.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/List_View_Item_Items.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';

class Items extends StatefulWidget {
  static const RouteName = "/Item";

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  DbHelper helper=DbHelper();
  bool _isLoading=false;
  String cateOfferName;

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Builder(
      builder : (BuildContext context){
    final ItemData=Provider.of<Chains>(context);
    return Scaffold(
      body:_isLoading?Center(child: CircularProgressIndicator()):ListView.builder(
          padding: EdgeInsets.only(bottom: 70,top: 25),
          itemBuilder: (ctx,index)=>ItemsListView(
            ItemData.subCategory[index]['id'],
            ItemData.subCategory[index]['Itemname'],
            ItemData.subCategory[index]['imgUrl'],
            ItemData.subCategory[index]['SubCate'],
          ),
          itemCount: ItemData.subCategory.length,
        ),
      floatingActionButton: _isLoading?SizedBox():FloatingActionButton.extended(
        onPressed: ()async {
          if(ItemData.selectedCategory=='NESCAFE'){
            cateOfferName='Coffee';
          }else if(ItemData.selectedCategory=='Biscuits'){
            cateOfferName='Chocolate';
          }else{
            cateOfferName=ItemData.selectedCategory;
          }
          int items=0;
      setState(() {
        _isLoading = true;
      });
      final tables = await helper.allFinalData();

      for(int i=0;i<tables.length;i++){
        if(ItemData.id==tables[i]['branchid']&&tables[i]['catename'] == ItemData.selectedCategory){
          items=items+1;
        }
      }
      if(items==ItemData.subCategory.length) {
        Catesend CD = Catesend(
            branchid: ItemData.id,
            cate: ItemData.selectedCategory);
        int id = await helper.createcatesend(CD);
        print(id);
        _isLoading = false;
        Navigator.of(context).pop();
        Navigator.of(context).popAndPushNamed(Category.RouteName);
        if (ItemData.selectedCategory == 'BONJORNO'||ItemData.selectedCategory=='CONFECTIONERY') {
        }else{
        await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('Offers'),
              content: Text(
                  'There is any Offers in  $cateOfferName'),
              actions: [
                FlatButton(onPressed: () async{
                  Navigator.of(ctx).pushNamed(OffersScreen.RouteName);
                  final tables = await helper.allOurOfferData();
                  if(tables.isNotEmpty) {
                    for (int i = 0; i < tables.length; i++) {
                      ItemData.AddOurOfferItemId(tables[i]['id'].toString());
                    }
                  }
                }, child: Text('Yes')),
                FlatButton(onPressed: () {
                  Navigator.of(ctx).pop();
                }, child: Text('No'))
              ],
            )
        );
        }
           }else{
           Scaffold.of(context).removeCurrentSnackBar();
            Scaffold.of(context).showSnackBar(SnackBar(
              duration: Duration(milliseconds : 1000),
              content: Text('Complete the Rest before Upload'),
            ));
            setState(() {
              _isLoading=false;
            });
          }
      },
        icon: Icon(Icons.save),
        label: Text("Save"),
      ),
    );
  }
  )
  );
}
