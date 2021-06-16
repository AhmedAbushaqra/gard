import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:gard/translation/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:gard/CompetitorOfferScreen.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/models/OfferDataSheet.dart';
import 'package:gard/models/db_Our_Offer_Cate.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/List_View_Item.dart';
import 'package:gard/widgets/OurOfferCustomDialogBox.dart';
import 'package:provider/provider.dart';

class OffersScreen extends StatefulWidget {
  static const RouteName = "/offers";
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
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
        title: Text(LocaleKeys.Nestleoffer.tr(),style: TextStyle(color: Colors.black,fontSize: 30),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
     body: ListView(
       children: [
         Padding(
           padding: EdgeInsets.only(top: 20),
           child: itemData.ReviewPromotion==true?Container():Card(
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
                       height: min(itemData.subCategory.length*40.0+10,380),
                       child: ListView.builder(
                         itemCount: itemData.selectedCategory=='NESCAFE'?itemData.subCategoryOffers.length:
                         itemData.selectedCategory=='Biscuits'?itemData.subCategoryOffers.length:
                         itemData.subCategory.length,
                         itemBuilder: (ctx,index)=>Column(
                           children: [
                             Divider(),
                             ListTile(
                               title: itemData.selectedCategory=='NESCAFE'?Text(itemData.subCategoryOffers[index]['Itemname']):
                               itemData.selectedCategory=='Biscuits'?Text(itemData.subCategoryOffers[index]['Itemname']):
                               Text(itemData.subCategory[index]['Itemname']),
                               trailing: IconButton(
                                 icon: Icon(Icons.arrow_forward_ios),
                                 onPressed: (){
                                 },
                               ),
                               onTap: () async {
                                 if(itemData.selectedCategory=='NESCAFE'||itemData.selectedCategory=='Biscuits') {
                                   itemData.ourOfferCatetime = itemData.ourOfferCatetime + 1;
                                   dbOurOfferCate dbOC = dbOurOfferCate(
                                     id:itemData.subCategoryOffers[index]['id']+itemData.ourOfferCatetime.toString(),
                                     branchid:itemData.id,
                                     itemnum:itemData.subCategoryOffers[index]['id'],
                                     ItemName:itemData.subCategoryOffers[index]['Itemname'],
                                     subcate:itemData.subCategoryOffers[index]['SubCate'],
                                     branch: itemData.selectedBranch,
                                     chain: itemData.selectedPlace,
                                     catename: itemData.selectedCategory,
                                     subBrand: '',
                                   );
                                   int id=await helper.createOurOfferCate(dbOC);
                                   print('id');
                                   setState(() {
                                     _expanded = false;
                                   });
                                 }else{
                                   itemData.ourOfferCatetime = itemData.ourOfferCatetime + 1;
                                   dbOurOfferCate dbOC = dbOurOfferCate(
                                     id:itemData.subCategory[index]['id']+itemData.ourOfferCatetime.toString(),
                                     branchid:itemData.id,
                                     itemnum:itemData.subCategory[index]['id'],
                                     ItemName:itemData.subCategory[index]['Itemname'],
                                     subcate:itemData.subCategory[index]['SubCate'],
                                     branch: itemData.selectedBranch,
                                     chain: itemData.selectedPlace,
                                     catename: itemData.selectedCategory,
                                     subBrand: '',
                                   );
                                   int id=await helper.createOurOfferCate(dbOC);
                                   print('id');
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
           height: 450,
           child: FutureBuilder(
             future: helper.allOurOfferCate(),
             builder: (context, AsyncSnapshot snapshot){
               return !snapshot.hasData?Center(child: CircularProgressIndicator(),): ListView.builder(
                 itemBuilder: (ctx,index)=>FutureBuilder(
                   future: Future.wait([helper.allOurOfferCate(),helper.allOurOfferData()]),
                   builder:(context, AsyncSnapshot snapshotCate){
               if (!snapshotCate.hasData) {
               return Center(child: CircularProgressIndicator(),);
               }else{
                 for (int i = 0; i < snapshotCate.data[0].length; i++) {
                   String dbid = snapshotCate.data[0][index]['id'].toString();
                   if (itemData.OurOfferItemId.contains(dbid)) {
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
                               return OurOfferCustomDialogBox(
                                id: snapshotCate.data[0][index]['id'].toString(),
                                branchid: snapshotCate.data[0][index]['branchid'],
                                chain: snapshotCate.data[0][index]['chain'],
                                branch: snapshotCate.data[0][index]['branch'],
                                itemnum: snapshotCate.data[0][index]['itemnum'],
                                catename: snapshotCate.data[0][index]['catename'],
                                subcate: snapshotCate.data[0][index]['subcate'],
                                subBrand: snapshotCate.data[0][index]['subBrand'],
                                ItemName: snapshotCate.data[0][index]['ItemName'],
                                 isExist: isExist,
                                 oldReason: oldReason,
                                 oldType: oldType,
                                 oldPrice: oldPrice,
                                 oldDetail: oldDetail,
                                 from: from,
                                 to: to,
                               );
                             });
                         for(int i=0;i<snapshotCate.data[1].length;i++){
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
                         }
                       },
                       title: Text(
                           '${snapshot.data[index]['ItemName']}'),
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
               final tables = await helper.allComOfferData();
               if(tables.isNotEmpty) {
                 for (int i = 0; i < tables.length; i++) {
                   itemData.AddCompOfferItemId(tables[i]['id'].toString());
                 }
               }
               await helper.clearAllOfferDataPreviousDay();
               Navigator.of(context).pushNamed(CompetitorOffersScreen.RouteName);
             },
             padding: EdgeInsets.all(10.0),
             color: Color.fromRGBO(0, 160, 227, 1),
             textColor: Colors.white,
             child:Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.dangerous,size: 30,color: Colors.red,),
                 SizedBox(width: 10,),
                 Text(LocaleKeys.competitorOffer.tr(), style: TextStyle(fontSize: 15)),
               ],
             ) ,
           ),
         ),
       ],
     ),
    );
  }
}
