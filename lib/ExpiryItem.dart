import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/models/chainModel.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/ExtraCustomDialogBox.dart';
import 'package:gard/widgets/List_View_Item_Items.dart';
import 'package:provider/provider.dart';

import 'models/extraItems.dart';

class ExpireItems extends StatefulWidget {
  static const RouteName = "/Expiry";
  @override
  _ExpireItemsState createState() => _ExpireItemsState();
}

class _ExpireItemsState extends State<ExpireItems> {
  bool isClick = false;
  var _expanded=false;
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
      body: ListView(
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
                                      extraCate: category[index]['cate']
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
                                    type: '${itemData.extraVisType} ${itemData.extraItem[index].extraCate}',
                                  );
                                });
                          },
                          title: Text(itemData.extraItem[index].extraCate),
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
    );
  }
}
