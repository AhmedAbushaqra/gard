import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gard/Category.dart';
import 'package:gard/ExpiryItem.dart';
import 'package:gard/Items.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/extra_vis_screen.dart';
import 'package:gard/models/db_catesend.dart';
import 'package:gard/models/final_data.dart';
import 'package:gard/models/product.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'models/chainModel.dart';

class CategoryListShape extends StatefulWidget {
  final String name;
  final String imgUrl;


  CategoryListShape(this.name,this.imgUrl,);

  @override
  _CategoryListShapeState createState() => _CategoryListShapeState();
}

class _CategoryListShapeState extends State<CategoryListShape> {
  bool isDone=false;

  bool isBonSent=false;

  bool isNescSent=false;

  bool isCoffeSent=false;

  bool isNidoSent=false;

  bool isbabySent=false;

  bool isNesqSent=false;

  bool isRTDSent=false;

  bool isMaggiSent=false;

  bool isCrealSent=false;

  bool isConfeSent=false;

  bool isBiscSent=false;

  bool isWaterSent=false;

  bool _isLoading=false;
  List<Chain> CategoryList = [];

  DbHelper helper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper=DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    final catagoryData=Provider.of<Chains>(context);
    String reportType=catagoryData.reportType;
    return _isLoading?Center(child: CircularProgressIndicator(),):FutureBuilder(
        future: Future.wait([helper.allCatesend(),helper.allCatesendsheet()]),
        builder: (context, AsyncSnapshot snapshot){
         if (!snapshot.hasData) {
           return Center(child: CircularProgressIndicator(),);
         }else{
             for(int i=0;i<snapshot.data[1].length;i++){
               if(catagoryData.id==snapshot.data[1][i]['branchid']){
                 if(snapshot.data[1][i]['catename']=='BONJORNO'){
                   isBonSent=true;
                 }else if(snapshot.data[1][i]['catename']=='NESCAFE'){
                   isNescSent=true;
                 }else if(snapshot.data[1][i]['catename']=='COFFEE-MATE'){
                   isCoffeSent=true;
                 }else if(snapshot.data[1][i]['catename']=='NIDO'){
                   isNidoSent=true;
                 }else if(snapshot.data[1][i]['catename']=='BABY FOOD'){
                   isbabySent=true;
                 }else if(snapshot.data[1][i]['catename']=='NESQUIK'){
                   isNesqSent=true;
                 }else if(snapshot.data[1][i]['catename']=='RTD'){
                   isRTDSent=true;
                 }else if(snapshot.data[1][i]['catename']=='MAGGI'){
                   isMaggiSent=true;
                 }else if(snapshot.data[1][i]['catename']=='CEREAL'){
                   isCrealSent=true;
                 }else if(snapshot.data[1][i]['catename']=='CONFECTIONERY'){
                   isConfeSent=true;
                 }else if(snapshot.data[1][i]['catename']=='Biscuits'){
                   isBiscSent=true;
                 }else if(snapshot.data[1][i]['catename']=='WATER'){
                   isWaterSent=true;
                 }

               }
             }
             for (int i = 0; i < snapshot.data[0].length; i++) {
               if(widget.name==snapshot.data[0][i]['catename']&&catagoryData.id==snapshot.data[0][i]['branchid']){
                isDone=true;
               }
             }
          return ClipRRect(
             borderRadius: BorderRadius.circular(10),
             child:GestureDetector(
               onTap: ()async{
                 if(isBonSent&&widget.name=='BONJORNO'
                     ||isNescSent&&widget.name=='NESCAFE'
                     ||isCoffeSent&&widget.name=='COFFEE-MATE'
                     ||isNidoSent&&widget.name=='NIDO'
                     ||isbabySent&&widget.name=='BABY FOOD'
                     ||isNesqSent&&widget.name=='NESQUIK'
                     ||isRTDSent&&widget.name=='RTD'
                     ||isMaggiSent&&widget.name=='MAGGI'
                     ||isCrealSent&&widget.name=='CEREAL'
                     ||isConfeSent&&widget.name=='CONFECTIONERY'
                     ||isBiscSent&&widget.name=='Biscuits'
                     ||isWaterSent&&widget.name=='WATER'){
                   print('done');
                   return;
                 }
                 CategoryList = [
                   Chain(
                     chain: widget.name,
                     imgUrl: widget.imgUrl,
                   )
                 ];
                 catagoryData.selectedCategory=widget.name;
                 catagoryData.onChangedSecondCallback(widget.name);
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
                 child: Image.asset(widget.imgUrl,fit: BoxFit.fill,),
                 // header: ,
                 footer: GridTileBar(
                   trailing:reportType=='Expire Report'?Container():
                   isDone==false?Container():
                   Container(
                       height: 45,
                       width: MediaQuery.of(context).size.width*0.14,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(25)),
                           color: Colors.lightBlue
                       ),
                       child:isBonSent&&widget.name=='BONJORNO'
                           ||isNescSent&&widget.name=='NESCAFE'
                           ||isCoffeSent&&widget.name=='COFFEE-MATE'
                           ||isNidoSent&&widget.name=='NIDO'
                           ||isbabySent&&widget.name=='BABY FOOD'
                           ||isNesqSent&&widget.name=='NESQUIK'
                           ||isRTDSent&&widget.name=='RTD'
                           ||isMaggiSent&&widget.name=='MAGGI'
                           ||isCrealSent&&widget.name=='CEREAL'
                           ||isConfeSent&&widget.name=='CONFECTIONERY'
                           ||isBiscSent&&widget.name=='Biscuits'
                           ||isWaterSent&&widget.name=='WATER'?Icon(Icons.done,size: 23,):
                       IconButton(icon: Icon(Icons.send,size: 23,), onPressed: () async{
                         if(widget.name=='BONJORNO') {
                           Catesend CD = Catesend(
                               branchid: catagoryData.id,
                               cate: widget.name);
                          // int id = await helper.createcatesendsheet(CD);
                           final tables = await helper.allFinalData();
                           for (int i = 0; i < tables.length; i++) {
                             if (catagoryData.id==tables[i]['branchid']&&tables[i]['catename'] == widget.name) {
                               setState(() {
                                 _isLoading=true;
                               });
                               /* showDialog(
                                   context: context,
                                   builder: (BuildContext context) => AlertDialog(
                                     title: Text('Waiting Upload Data'),
                                     content: Center(child: CircularProgressIndicator(),),
                                   )
                               );*/
                              /* await Future.delayed(const Duration(seconds: 5));
                               catagoryData.submitForm(FinalData(
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
                               });*/
                             }
                           }
                          /* await Future.delayed(const Duration(seconds: 4));
                           catagoryData.submitForm(FinalData(
                             branchid: catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                           });
                           //await Future.delayed(const Duration(seconds: 8));
                           catagoryData.submitSelfShare(FinalData(
                             branchid:catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                             Navigator.of(context).popAndPushNamed(Category.RouteName);
                           });*/
                         }else if(widget.name=='NESCAFE'&&isBonSent){
                           Catesend CD = Catesend(
                               branchid: catagoryData.id,
                               cate: widget.name);
                           int id = await helper.createcatesendsheet(CD);
                           print(id);
                           final tables = await helper.allFinalData();
                           for (int i = 0; i < tables.length; i++) {
                             if (catagoryData.id==tables[i]['branchid']&&tables[i]['catename'] == widget.name) {
                               print(tables[i]['id']);
                               await Future.delayed(const Duration(seconds: 5));
                               catagoryData.submitForm(FinalData(
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
                           catagoryData.submitForm(FinalData(
                             branchid: catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                           });
                           //await Future.delayed(const Duration(seconds: 8));
                           catagoryData.submitSelfShare(FinalData(
                             branchid:catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                             Navigator.of(context).popAndPushNamed(Category.RouteName);
                           });
                         }else if(widget.name=='COFFEE-MATE'&&isNescSent){
                           Catesend CD = Catesend(
                               branchid: catagoryData.id,
                               cate: widget.name);
                           int id = await helper.createcatesendsheet(CD);
                           print(id);
                           final tables = await helper.allFinalData();
                           for (int i = 0; i < tables.length; i++) {
                             if (catagoryData.id==tables[i]['branchid']&&tables[i]['catename'] == widget.name) {
                               print(tables[i]['id']);
                               await Future.delayed(const Duration(seconds: 5));
                               catagoryData.submitForm(FinalData(
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
                           catagoryData.submitForm(FinalData(
                             branchid: catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                           });
                           //await Future.delayed(const Duration(seconds: 8));
                           catagoryData.submitSelfShare(FinalData(
                             branchid:catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                             Navigator.of(context).popAndPushNamed(Category.RouteName);
                           });
                         }else if(widget.name=='NIDO'&&isCoffeSent){
                           Catesend CD = Catesend(
                               branchid: catagoryData.id,
                               cate: widget.name);
                           int id = await helper.createcatesendsheet(CD);
                           print(id);
                           final tables = await helper.allFinalData();
                           for (int i = 0; i < tables.length; i++) {
                             if (catagoryData.id==tables[i]['branchid']&&tables[i]['catename'] == widget.name) {
                               print(tables[i]['id']);
                               await Future.delayed(const Duration(seconds: 5));
                               catagoryData.submitForm(FinalData(
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
                           catagoryData.submitForm(FinalData(
                             branchid: catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                           });
                           //await Future.delayed(const Duration(seconds: 8));
                           catagoryData.submitSelfShare(FinalData(
                             branchid:catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                             Navigator.of(context).popAndPushNamed(Category.RouteName);
                           });
                         }else if(widget.name=='BABY FOOD'&&isNidoSent){
                           Catesend CD = Catesend(
                               branchid: catagoryData.id,
                               cate: widget.name);
                           int id = await helper.createcatesendsheet(CD);
                           print(id);
                           final tables = await helper.allFinalData();
                           for (int i = 0; i < tables.length; i++) {
                             if (catagoryData.id==tables[i]['branchid']&&tables[i]['catename'] == widget.name) {
                               print(tables[i]['id']);
                               await Future.delayed(const Duration(seconds: 5));
                               catagoryData.submitForm(FinalData(
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
                           catagoryData.submitForm(FinalData(
                             branchid: catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                           });
                           //await Future.delayed(const Duration(seconds: 8));
                           catagoryData.submitSelfShare(FinalData(
                             branchid:catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                             Navigator.of(context).popAndPushNamed(Category.RouteName);
                           });
                         }else if(widget.name=='NESQUIK'&&isbabySent){
                           Catesend CD = Catesend(
                               branchid: catagoryData.id,
                               cate: widget.name);
                           int id = await helper.createcatesendsheet(CD);
                           print(id);
                           final tables = await helper.allFinalData();
                           for (int i = 0; i < tables.length; i++) {
                             if (catagoryData.id==tables[i]['branchid']&&tables[i]['catename'] == widget.name) {
                               print(tables[i]['id']);
                               await Future.delayed(const Duration(seconds: 5));
                               catagoryData.submitForm(FinalData(
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
                           catagoryData.submitForm(FinalData(
                             branchid: catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                           });
                           //await Future.delayed(const Duration(seconds: 8));
                           catagoryData.submitSelfShare(FinalData(
                             branchid:catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                             Navigator.of(context).popAndPushNamed(Category.RouteName);
                           });
                         }else if(widget.name=='RTD'&&isNesqSent){
                           Catesend CD = Catesend(
                               branchid: catagoryData.id,
                               cate: widget.name);
                           int id = await helper.createcatesendsheet(CD);
                           print(id);
                           final tables = await helper.allFinalData();
                           for (int i = 0; i < tables.length; i++) {
                             if (catagoryData.id==tables[i]['branchid']&&tables[i]['catename'] == widget.name) {
                               print(tables[i]['id']);
                               await Future.delayed(const Duration(seconds: 5));
                               catagoryData.submitForm(FinalData(
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
                           catagoryData.submitForm(FinalData(
                             branchid: catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                           });
                           //await Future.delayed(const Duration(seconds: 8));
                           catagoryData.submitSelfShare(FinalData(
                             branchid:catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                             Navigator.of(context).popAndPushNamed(Category.RouteName);
                           });
                         }else if(widget.name=='MAGGI'&&isRTDSent){
                           Catesend CD = Catesend(
                               branchid: catagoryData.id,
                               cate: widget.name);
                           int id = await helper.createcatesendsheet(CD);
                           print(id);
                           final tables = await helper.allFinalData();
                           for (int i = 0; i < tables.length; i++) {
                             if (catagoryData.id==tables[i]['branchid']&&tables[i]['catename'] == widget.name) {
                               print(tables[i]['id']);
                               await Future.delayed(const Duration(seconds: 5));
                               catagoryData.submitForm(FinalData(
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
                           catagoryData.submitForm(FinalData(
                             branchid: catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                           });
                           //await Future.delayed(const Duration(seconds: 8));
                           catagoryData.submitSelfShare(FinalData(
                             branchid:catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                             Navigator.of(context).popAndPushNamed(Category.RouteName);
                           });
                         }else if(widget.name=='CEREAL'&&isMaggiSent){
                           Catesend CD = Catesend(
                               branchid: catagoryData.id,
                               cate: widget.name);
                           int id = await helper.createcatesendsheet(CD);
                           print(id);
                           final tables = await helper.allFinalData();
                           for (int i = 0; i < tables.length; i++) {
                             if (catagoryData.id==tables[i]['branchid']&&tables[i]['catename'] == widget.name) {
                               print(tables[i]['id']);
                               await Future.delayed(const Duration(seconds: 5));
                               catagoryData.submitForm(FinalData(
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
                           catagoryData.submitForm(FinalData(
                             branchid: catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                           });
                           //await Future.delayed(const Duration(seconds: 8));
                           catagoryData.submitSelfShare(FinalData(
                             branchid:catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                             Navigator.of(context).popAndPushNamed(Category.RouteName);
                           });
                         }else if(widget.name=='CONFECTIONERY'&&isCrealSent){
                           Catesend CD = Catesend(
                               branchid: catagoryData.id,
                               cate: widget.name);
                           int id = await helper.createcatesendsheet(CD);
                           print(id);
                           final tables = await helper.allFinalData();
                           for (int i = 0; i < tables.length; i++) {
                             if (catagoryData.id==tables[i]['branchid']&&tables[i]['catename'] == widget.name) {
                               print(tables[i]['id']);
                               await Future.delayed(const Duration(seconds: 5));
                               catagoryData.submitForm(FinalData(
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
                           catagoryData.submitForm(FinalData(
                             branchid: catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                           });
                           //await Future.delayed(const Duration(seconds: 8));
                           catagoryData.submitSelfShare(FinalData(
                             branchid:catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                             Navigator.of(context).popAndPushNamed(Category.RouteName);
                           });
                         }else if(widget.name=='Biscuits'&&isConfeSent){
                           Catesend CD = Catesend(
                               branchid: catagoryData.id,
                               cate: widget.name);
                           int id = await helper.createcatesendsheet(CD);
                           print(id);
                           final tables = await helper.allFinalData();
                           for (int i = 0; i < tables.length; i++) {
                             if (catagoryData.id==tables[i]['branchid']&&tables[i]['catename'] == widget.name) {
                               print(tables[i]['id']);
                               await Future.delayed(const Duration(seconds: 5));
                               catagoryData.submitForm(FinalData(
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
                           catagoryData.submitForm(FinalData(
                             branchid: catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                           });
                           //await Future.delayed(const Duration(seconds: 8));
                           catagoryData.submitSelfShare(FinalData(
                             branchid:catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                             Navigator.of(context).popAndPushNamed(Category.RouteName);
                           });
                         }else if(widget.name=='WATER'&&isBiscSent){
                           Catesend CD = Catesend(
                               branchid: catagoryData.id,
                               cate: widget.name);
                           int id = await helper.createcatesendsheet(CD);
                           print(id);
                           final tables = await helper.allFinalData();
                           for (int i = 0; i < tables.length; i++) {
                             if (catagoryData.id==tables[i]['branchid']&&tables[i]['catename'] == widget.name) {
                               print(tables[i]['id']);
                               await Future.delayed(const Duration(seconds: 5));
                               catagoryData.submitForm(FinalData(
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
                           catagoryData.submitForm(FinalData(
                             branchid: catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                           });
                           //await Future.delayed(const Duration(seconds: 8));
                           catagoryData.submitSelfShare(FinalData(
                             branchid:catagoryData.id,
                             date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                             chain: catagoryData.selectedPlace,
                             branch: catagoryData.selectedBranch,
                             catename: widget.name + " Shelf Share",
                             subcatename: "",
                             itemname: "",
                             capacity: "0%",
                             faces: '',
                           ), (String response) {
                             print("Response:$response");
                             Navigator.of(context).popAndPushNamed(Category.RouteName);
                           });
                         } else{
                           Scaffold.of(context).removeCurrentSnackBar();
                           Scaffold.of(context).showSnackBar(SnackBar(
                             duration: Duration(milliseconds : 1000),
                             content: Text('ٍSend Data in The Order'),
                           ));
                         }
                         /*
                         final tables = await helper.allFinalData();
                         for (int i = 0; i < tables.length; i++) {
                           if (catagoryData.id==tables[i]['branchid']&&tables[i]['catename'] == name) {
                             print(tables[i]['id']);
                             await Future.delayed(const Duration(seconds: 5));
                             catagoryData.submitForm(FinalData(
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
                         catagoryData.submitForm(FinalData(
                           branchid: catagoryData.id,
                           date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                           chain: catagoryData.selectedPlace,
                           branch: catagoryData.selectedBranch,
                           catename: name + " Shelf Share",
                           subcatename: "",
                           itemname: "",
                           capacity: "0%",
                           faces: '',
                         ), (String response) {
                           print("Response:$response");
                         });
                         //await Future.delayed(const Duration(seconds: 8));
                         catagoryData.submitSelfShare(FinalData(
                           branchid:catagoryData.id,
                           date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                           chain: catagoryData.selectedPlace,
                           branch: catagoryData.selectedBranch,
                           catename: name + " Shelf Share",
                           subcatename: "",
                           itemname: "",
                           capacity: "0%",
                           faces: '',
                         ), (String response) {
                           print("Response:$response");
                         });*/
                       },)
                   ),
                   backgroundColor: Colors.black54,
                   title: Text(
                     widget.name,
                     style: TextStyle(fontSize: 12),
                     textAlign: TextAlign.center,
                   ),
                 ),
               ),
             ),
           );
         }
        }
    );
  }
}
