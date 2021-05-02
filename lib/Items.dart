import 'package:flutter/material.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/models/final_data.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/List_View_Item_Items.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';

class Items extends StatelessWidget {
  static const RouteName = "/Item";
  DbHelper helper=DbHelper();
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()async {
          final tables = await helper.allFinalData();
          print(tables);
           /* ItemData.submitForm(FinalData(
              branchid: ItemData.id,
              date:  DateFormat.yMMMMd("en_US").format(DateTime.now()),
              chain: ItemData.selectedPlace,
              branch: ItemData.selectedBranch,
              catename: ItemData.selectedCategory+" Shelf Share",
              subcatename: "",
              itemname: "",
              capacity: "",
              faces: '',
            ), (String response) {
              print("Response:$response");
            });*/
           // Navigator.of(context).pop();
        },
        icon: Icon(Icons.save),
        label: Text("Save"),
      ),
    );
  }
}
