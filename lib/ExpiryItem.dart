import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/models/ExtraData.dart';
import 'package:gard/models/chainModel.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/ExtraCustomDialogBox.dart';
import 'package:gard/widgets/List_View_Item_Items.dart';
import 'package:provider/provider.dart';

import 'models/extraItems.dart';
import 'models/final_data.dart';

class ExpireItems extends StatefulWidget {
  static const RouteName = "/Expiry";
  @override
  _ExpireItemsState createState() => _ExpireItemsState();
}

class _ExpireItemsState extends State<ExpireItems> {
  bool isClick = false;
  var _expanded=false;
  bool _isLoading=false;
  DbHelper helper=DbHelper();
  var _expireItem=Chain(
    id: '',
    chain: '',
    branch: '',
    imgUrl: '',
  );
  var _extraItem=ExtraItem(
    id: '',
    extraCate: '',
  );
  var category = [
    {'id': '0001',
      'cate': 'Nescafe'},
    {'id': '0002',
      'cate': 'Maggi'},
    {'id': '0003',
      'cate': 'Cerelac'},
    {'id': '0004',
      'cate': 'Nido'},
    {'id': '0005',
      'cate': 'Nesquik'},
    {'id': '0006',
      'cate': 'Kitkat'},
    {'id': '0007',
      'cate': 'Coffe Mix'},
    {'id': '0008',
      'cate': 'Cappuccino'},
    {'id': '0009',
      'cate': 'Water'},
    {'id': '00010',
      'cate': 'Bonjorno'},
    {'id': '00011',
      'cate': 'Nestle'},
    {'id': '00012',
      'cate': 'Confectionery'},
  ];
  var fridgeCate = [
    {'id': '00013',
      'cate': 'Fridge Water'},
    {'id': '00014',
      'cate': 'Fridge KitKat'}
  ];
  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<Chains>(context);
    String reportType=itemData.reportType;
    String extraReportType=itemData.extraVisType;
    return Scaffold(
      body: _isLoading?Center(child: CircularProgressIndicator()):ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Card(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(reportType=='Extra Vis.'?extraReportType:itemData.selectedCategory),
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
                      height: reportType=='Expire Report'?min(itemData.subCategory.length*40.0+10,380):
                              extraReportType=='Fridge'?min(fridgeCate.length*40.0+10,380):
                               min(category.length*40.0+10,380),
                      child: ListView.builder(
                        itemCount: reportType=='Expire Report'?itemData.subCategory.length:
                                   extraReportType=='Fridge'?fridgeCate.length:
                                   category.length,
                          itemBuilder: (ctx,index)=>Column(
                            children: [
                              Divider(),
                              ListTile(
                                title: reportType=='Expire Report'?Text(itemData.subCategory[index]['Itemname']):
                                        extraReportType=='Fridge'?Text(fridgeCate[index]['cate']):
                                         Text(category[index]['cate']),
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_forward_ios),
                                  onPressed: (){
                                    print('${index}   ${category.length}  ${category[index]['cate']}');
                                  },
                                ),
                                onTap: (){
                                  if(reportType=='Expire Report') {
                                    _expireItem = Chain(
                                      id: itemData.subCategory[index]['id'],
                                      chain: itemData.subCategory[index]
                                          ['SubCate'],
                                      branch: itemData.subCategory[index]
                                          ['Itemname'],
                                      imgUrl: itemData.subCategory[index]
                                          ['imgUrl'],
                                    );
                                    itemData.AddProduct(_expireItem);
                                    setState(() {
                                      _expanded = false;
                                    });
                                  }else if(extraReportType=='Fridge'){
                                    _extraItem=ExtraItem(
                                      id: fridgeCate[index]['id'],
                                      extraCate: fridgeCate[index]['cate']
                                    );
                                    itemData.AddExtraItem(_extraItem);
                                    setState(() {
                                      _expanded = false;
                                    });
                                  }else{
                                    _extraItem=ExtraItem(
                                      id: category[index]['id'],
                                      extraCate:'${itemData.extraVisType} ${category[index]['cate']}'
                                    );
                                    itemData.AddExtraItem(_extraItem);
                                    setState(() {
                                      _expanded = false;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                          )
                      ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 650,
            child: FutureBuilder(
              future: helper.allFinalData(),
              builder: (context, AsyncSnapshot snapshot){
                return reportType=='Expire Report'?ListView.builder(
              itemBuilder: (ctx,index)=>ItemsListView(
                itemData.expireItems[index].id,
                itemData.expireItems[index].branch,
                itemData.expireItems[index].imgUrl,
                itemData.expireItems[index].chain,
              ),
              itemCount: itemData.expireItems.length,
            ):ListView.builder(
                    itemBuilder:(ctx,index)=>
                        Column(
                      children: [
                        Divider(),
                        ListTile(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ExtraCustomDialogBox(
                                    id: itemData.extraItem[index].id,
                                    type: ' ${itemData.extraItem[index].extraCate}',
                                  );
                                });
                          },
                          title: Text('${itemData.extraItem[index].extraCate}'),
                          trailing: Checkbox(
                            value: isClick,
                            onChanged: (value) {
                              setState(() {
                                value = isClick;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  itemCount: itemData.extraItem.length,
                );
        },
     ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()async {
          setState(() {
            _isLoading=true;
          });
          final tables = await helper.allExtraData();
          //if(tables.takeWhile((value) => value['catename']==ItemData.selectedCategory).length==ItemData.subCategory.length) {
            for(int i=0;i<tables.length;i++){
              await Future.delayed(const Duration(seconds: 4));
                itemData.submitExtraForm(ExtraData(
                  branchid: tables[i]['branchid'],
                  date: tables[i]['date'],
                  chain: tables[i]['chain'],
                  branch: tables[i]['branch'],
                  type: tables[i]['type'],
                  capacity: tables[i]['capacity'],
                  faces: tables[i]['faces'],
                  situation: tables[i]['situation'],
                  condition: tables[i]['condition'],
                ), (String response)async {
                  print("Response:$response");
                  print(tables[i]['id']);
                });
            }
           setState(() {
             _isLoading=false;
           });
            Navigator.of(context).pop();
         /* }else{
            Scaffold.of(context).removeCurrentSnackBar();
            Scaffold.of(context).showSnackBar(SnackBar(
              duration: Duration(milliseconds : 1000),
              content: Text('Complete the Rest before Upload'),
            ));
            setState(() {
             // _isLoading=false;
            });
          }*/
        },
        icon: Icon(Icons.save),
        label: Text("Save"),
      ),
    );
  }
}
