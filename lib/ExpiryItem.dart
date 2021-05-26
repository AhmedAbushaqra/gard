import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/models/ExtraCate.dart';
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
    {'id': '1',
      'cate': 'Nescafe'},
    {'id': '2',
      'cate': 'Maggi'},
    {'id': '3',
      'cate': 'Cerelac'},
    {'id': '4',
      'cate': 'Nido'},
    {'id': '5',
      'cate': 'Nesquik'},
    {'id': '6',
      'cate': 'Kitkat'},
    {'id': '7',
      'cate': 'Coffe Mix'},
    {'id': '8',
      'cate': 'Cappuccino'},
    {'id': '9',
      'cate': 'Water'},
    {'id': '10',
      'cate': 'Bonjorno'},
    {'id': '11',
      'cate': 'Nestle'},
    {'id': '12',
      'cate': 'Confectionery'},
  ];
  var fridgeCate = [
    {'id': '13',
      'cate': 'Fridge Water'},
    {'id': '14',
      'cate': 'Fridge KitKat'}
  ];
  DbHelper helper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper=DbHelper();
  }
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
                                onTap: () async {
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
                                    itemData.extraCatetime=itemData.extraCatetime+1;
                                    ExtraCate dbEC=ExtraCate(
                                      id: fridgeCate[index]['id']+itemData.extraCatetime.toString(),
                                      extraName: fridgeCate[index]['cate'],
                                    );
                                    //itemData.AddExtraItem(_extraItem);
                                    int id = await helper.createExtraCate(dbEC);
                                    setState(() {
                                      _expanded = false;
                                    });
                                  }else{
                                    itemData.extraCatetime=itemData.extraCatetime+1;
                                    ExtraCate dbEC=ExtraCate(
                                      id: category[index]['id']+itemData.extraCatetime.toString(),
                                      extraName:'${itemData.extraVisType} ${category[index]['cate']}'
                                    );
                                    //String ExtraId=category[index]['id']+itemData.extraCatetime.toString();
                                    //itemData.AddExtraItemId(ExtraId);
                                    int id =await helper.createExtraCate(dbEC);
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
            height: 550,
            child: FutureBuilder(
              future: helper.allExtraCate(),
              builder: (context, AsyncSnapshot snapshot){
                return !snapshot.hasData?Center(child: CircularProgressIndicator(),):reportType=='Expire Report'?ListView.builder(
              itemBuilder: (ctx,index)=>ItemsListView(
                itemData.expireItems[index].id,
                itemData.expireItems[index].branch,
                itemData.expireItems[index].imgUrl,
                itemData.expireItems[index].chain,
              ),
              itemCount: itemData.expireItems.length,
            ):ListView.builder(
                        itemBuilder:(ctx,index)=>FutureBuilder(
                            future: helper.allExtraCate(),
                            builder: (context, AsyncSnapshot snapshotCate){
                            if (!snapshotCate.hasData) {
                                    return Center(child: CircularProgressIndicator(),);
                            } else {
                              for (int i = 0; i < snapshotCate.data.length; i++) {
                                String dbid = itemData.id + snapshotCate.data[index]['id'].toString();
                                print(dbid);
                                print(itemData.extraItemId);
                                if (itemData.extraItemId.contains(dbid)) {
                                  print(dbid);
                                  print(itemData.extraItemId);
                                  isClick = true;
                                }else{
                                  isClick=false;
                                }
                              }
                              return Column(
                                children: [
                                  Divider(),
                                  ListTile(
                                    onTap: () async {
                                      //String dbid = itemData.id + snapshotCate.data[index]['id'].toString();
                                      //print(itemData.extraItem[index]);
                                      /* final tables = await helper.allExtraData();
                                    //print(itemData.id + snapshot.data[index]['id'].toString());
                                    //print(tables);
                                    //Future.delayed(Duration(seconds: 5));
                                     for (int i=0; i < tables.length; i++) {
                                       String dbid = itemData.id + snapshot.data[index]['id'].toString();
                                       if (tables[i]['id']==int.parse(dbid)) {
                                         print(dbid);
                                         print('true');
                                         isClick = true;
                                       } else {
                                         print(dbid);
                                         print(tables[i]['id']);
                                         print('false');
                                       }
                                     }*/
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ExtraCustomDialogBox(
                                              id: snapshotCate.data[index]['id']
                                                  .toString(),
                                              type: ' ${snapshotCate
                                                  .data[index]['extraName']}',
                                            );
                                          });
                                    },
                                    title: Text(
                                        '${snapshot.data[index]['extraName']}'),
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
                              );
                            }
                    }
                ),
                        itemCount: snapshot.data.length,
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
