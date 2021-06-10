import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/models/db_Our_Offer_Cate.dart';
import 'package:gard/models/db_comp_offerCate.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/CompOfferCustomDialogBox.dart';
import 'package:gard/widgets/OurOfferCustomDialogBox.dart';
import 'package:provider/provider.dart';

class CompetitorOffersScreen extends StatefulWidget {
  static const RouteName = "/compatitoroffers";
  @override
  _CompetitorOffersScreenState createState() => _CompetitorOffersScreenState();
}

class _CompetitorOffersScreenState extends State<CompetitorOffersScreen> {
  var _expanded=false;
  bool _isLoading=false;
  bool isExist=false;
  bool isClick = false;
  String oldReason;
  String oldType;
  String oldPrice;
  String oldDetail;
  String from;
  String to;

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Competitor Offer',style: TextStyle(color: Colors.black,fontSize: 30),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                    title: Text(itemData.selectedCategory=='NESCAFE'?'Coffe Offers':
                    itemData.selectedCategory=='Biscuits'?'Chocolate Offers':itemData.selectedCategory),
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
                        height: min(itemData.Competator.length*40.0+10,380),
                        child: ListView.builder(
                          itemCount: itemData.Competator.length,
                          itemBuilder: (ctx,index)=>Column(
                            children: [
                              Divider(),
                              ListTile(
                                title: Text(itemData.Competator[index]['name']),
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_forward_ios),
                                  onPressed: (){
                                  },
                                ),
                                onTap: () async {
                                    itemData.CompOfferCatetime = itemData.CompOfferCatetime + 1;
                                    dbCompOfferCate dbOC = dbCompOfferCate(
                                      id:itemData.Competator[index]['id']+itemData.CompOfferCatetime.toString(),
                                      branchid:itemData.id,
                                      catename: itemData.selectedCategory=='NESCAFE'?'Coffe':itemData.selectedCategory=='Biscuits'?'Chocolate':itemData.selectedCategory,
                                      company: itemData.Competator[index]['name'],
                                    );
                                    int id=await helper.createComOfferCate(dbOC);
                                    print('id');
                                    setState(() {
                                      _expanded = false;
                                    });
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
            height: 450,
            child: FutureBuilder(
              future: helper.allComOfferCate(),
              builder: (context, AsyncSnapshot snapshot){
                return !snapshot.hasData?Center(child: CircularProgressIndicator(),): ListView.builder(
                  itemBuilder: (ctx,index)=>FutureBuilder(
                    future: Future.wait([helper.allComOfferCate(),helper.allComOfferData()]),
                    builder:(context, AsyncSnapshot snapshotCate){
                      if (!snapshotCate.hasData) {
                        return Center(child: CircularProgressIndicator(),);
                      }else{
                        for (int i = 0; i < snapshotCate.data[0].length; i++) {
                          String dbid = snapshotCate.data[0][index]['id'].toString();
                          if (itemData.CompOfferItemId.contains(dbid)) {
                            isClick = true;
                          }else{
                            isClick=false;
                          }
                        }
                        return snapshotCate.data[0][index]['branchid']!=itemData.id?Container():Column(
                          children: [
                            Divider(),
                            ListTile(
                              onTap: () async {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CompOfferCustomDialogBox(
                                        id: snapshotCate.data[0][index]['id'].toString(),
                                        branchid: snapshotCate.data[0][index]['branchid'],
                                        catename: snapshotCate.data[0][index]['catename'],
                                        company: snapshotCate.data[0][index]['company'],
                                      /*  isExist: isExist,
                                        oldReason: oldReason,
                                        oldType: oldType,
                                        oldPrice: oldPrice,
                                        oldDetail: oldDetail,
                                        from: from,
                                        to: to,*/
                                      );
                                    });
                                /*for(int i=0;i<snapshotCate.data[1].length;i++){
                                  if (snapshotCate.data[0][index]['id'].toString()==snapshotCate.data[1][i]['id'].toString()) {
                                    isExist=true;
                                    oldReason= snapshotCate.data[1][index]['pormotionreason'];
                                    oldType= snapshotCate.data[1][index]['pormotiontype'];
                                    oldPrice= snapshotCate.data[1][index]['mainprice'];
                                    oldDetail= snapshotCate.data[1][index]['pormotiondetail'];
                                    from= snapshotCate.data[1][index]['startdate'];
                                    to= snapshotCate.data[1][index]['enddate'];
                                    return;
                                  }else{
                                    isExist=false;
                                  }
                                }*/
                              },
                              title: Text(
                                  '${snapshot.data[index]['company']}'),
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
                    },
                  ),
                  itemCount: snapshot.data.length,
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 50.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
              onPressed: () async{
                final Comptables = await helper.allComOfferData();
                final Ourtables = await helper.allOurOfferData();
                int CompLength=0;
                int OurLength=0;
                for(int i=0;i<Ourtables.length;i++){
                  if(Ourtables[i]['catename']==itemData.selectedCategory&&Ourtables[i]['branchid']==itemData.id){
                    OurLength++;
                  }
                }
                for(int i=0;i<Comptables.length;i++){
                  if(Comptables[i]['catename']==itemData.selectedCategory&&Comptables[i]['branchid']==itemData.id){
                    CompLength++;
                  }else if(Comptables[i]['catename']=='Coffe'&&Comptables[i]['branchid']==itemData.id){
                    CompLength++;
                  }else if(Comptables[i]['catename']=='Chocolate'&&Comptables[i]['branchid']==itemData.id){
                    CompLength++;
                  }
                }

                if(OurLength>CompLength){
                for(int i=0;i<OurLength;i++){
                  print(Comptables[i]);

                }
                }else{

                }

              },
              padding: EdgeInsets.all(10.0),
              color: Color.fromRGBO(0, 160, 227, 1),
              textColor: Colors.white,
              child:Text(itemData.selectedCategory=='NESCAFE'?'Save Coffe Offers':
              itemData.selectedCategory=='Biscuits'?'Save Chocolate Offers':'Save ${itemData.selectedCategory} Offers'),
            ),
          ),
        ],
      ),
    );
  }
}
