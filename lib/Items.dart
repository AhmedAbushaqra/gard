import 'package:flutter/material.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/models/final_data.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/List_View_Item_Items.dart';
import 'package:intl/intl.dart';
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
      for (int i = 0; i < tables.length; i++) {
        if (ItemData.id==tables[i]['branchid']&&tables[i]['catename'] == ItemData.selectedCategory) {
          print(tables[i]['id']);
          await Future.delayed(const Duration(seconds: 5));
          ItemData.submitForm(FinalData(
            branchid: tables[i]['branchid'],
            date: tables[i]['date'],
            chain: tables[i]['chain'],
            branch: tables[i]['branch'],
            catename: tables[i]['catename'],
            subcatename: tables[i]['subcatename'],
            itemname: tables[i]['itemname'],
            capacity: tables[i]['capacity'],
            faces: tables[i]['faces'],
          ), (String response) async {
            print("Response:$response");
            print(tables[i]['id']);
          });
        }
      }
      await Future.delayed(const Duration(seconds: 8));
      ItemData.submitForm(FinalData(
        branchid: ItemData.id,
        date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
        chain: ItemData.selectedPlace,
        branch: ItemData.selectedBranch,
        catename: ItemData.selectedCategory + " Shelf Share",
        subcatename: "",
        itemname: "",
        capacity: "0%",
        faces: '',
      ), (String response) {
        print("Response:$response");
      });
      //await Future.delayed(const Duration(seconds: 8));
      ItemData.submitSelfShare(FinalData(
        branchid: ItemData.id,
        date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
        chain: ItemData.selectedPlace,
        branch: ItemData.selectedBranch,
        catename: ItemData.selectedCategory + " Shelf Share",
        subcatename: "",
        itemname: "",
        capacity: "0%",
        faces: '',
      ), (String response) {
        print("Response:$response");
      });
      _isLoading = false;
      Navigator.of(context).pop();
           }else{
            print(tables[1]);
            print(tables.takeWhile((value) => value['catename']==ItemData.selectedCategory).length);
            print(ItemData.subCategory.length);
            print(tables[1]['catename']);
            print(ItemData.selectedCategory);
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
