import 'package:flutter/material.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/models/ExpiryData.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:provider/provider.dart';
import 'CategoryListShape.dart';

class Category extends StatefulWidget {
  static const RouteName = "/selectItem";

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  DbHelper helper;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper=DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    final categoryData=Provider.of<Chains>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05,bottom: categoryData.reportType=='Expire Report'?55:1),
        child: FutureBuilder(
          future: Future.wait([helper.allCatesend(),helper.allCatesendsheet()]),
          builder: (context, AsyncSnapshot snapshot){
              if (!snapshot.hasData) {
                   return Center(child: CircularProgressIndicator(),);
              }else{
                return GridView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: categoryData.Category.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                    childAspectRatio: 3/2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (ctx,i)=>FutureBuilder(
                    future: Future.wait([helper.allCatesend(),helper.allCatesendsheet()]),
                    builder: (context, AsyncSnapshot snapshot){
                      if(snapshot.connectionState==ConnectionState.done){
                         if(snapshot.hasData){
                           return CategoryListShape(categoryData.Category[i]['cateName'],categoryData.Category[i]['cateImage'],);
                         }else{
                           return Container();
                         }
                      }else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                    },
                  ),
                      //CategoryListShape(categoryData.Category[i]['cateName'],categoryData.Category[i]['cateImage'],),
                );
              }
          }
        ),
      ),

      floatingActionButton: categoryData.reportType=='Expire Report'?FloatingActionButton.extended(
        onPressed: ()async {
          final tables = await helper.allExpireData();
                for(int i=0;i<tables.length;i++) {
                    if (tables[i]['branchid'] == categoryData.id) {
                       await Future.delayed(const Duration(seconds: 4));
                       categoryData.submitExpiryForm(ExpiryData(
                         branchid: tables[i]['branchid'],
                         chain: tables[i]['chain'],
                         branch: tables[i]['branch'],
                         itemnum: tables[i]['itemnum'],
                         catename: tables[i]['catename'],
                         subcatename: tables[i]['subcatename'],
                         itemname: tables[i]['itemname'],
                         count: tables[i]['count'],
                         itemtype: tables[i]['itemtype'],
                         expirydate: tables[i]['expirydate'],
                       ), (String response) {
                         print("Response:$response");
                       });
                       Navigator.of(context).pop();
              }
            }
        },
        icon: Icon(Icons.save),
        label: Text("Save"),
      ):Container()
    );
  }
}
