import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/models/OfferDataSheet.dart';
import 'package:gard/models/db_Our_Offer_Cate.dart';
import 'package:gard/models/db_allOfferData.dart';
import 'package:gard/models/db_comp_offerCate.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/CompOfferCustomDialogBox.dart';
import 'package:gard/widgets/OurOfferCustomDialogBox.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gard/translation/locale_keys.g.dart';

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
  String oldItemName;
  String oldReason;
  String oldType;
  String oldPrice;
  String oldDetail;
  String from;
  String to;


  int id;
  String branchid;
  String chain;
  String branch;
  String itemnum;
  String catename;
  String subcatename;
  String subBrand;
  String itemname;
  String MainPrice;
  String PormotionReason;
  String pormotiontype;
  String PormotionDetails;
  String startdate;
  String enddate;
  String compid;
  String compcatename;
  String company;
  String compitemname;
  String compMainPrice;
  String compPormotionReason;
  String comppormotiontype;
  String compPormotionDetails;
  String compstartdate;
  String compenddate;

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
        title: Text(LocaleKeys.competitorOffer.tr(),style: TextStyle(color: Colors.black,fontSize: 30),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _isLoading?Center(child: CircularProgressIndicator(),):ListView(
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
                                        isExist: isExist,
                                        oldItemName: oldItemName,
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
                                    oldItemName=snapshotCate.data[1][i]['ItemName'];
                                    oldReason= snapshotCate.data[1][i]['pormotionreason'];
                                    oldType= snapshotCate.data[1][i]['pormotiontype'];
                                    oldPrice= snapshotCate.data[1][i]['mainprice'];
                                    oldDetail= snapshotCate.data[1][i]['pormotiondetail'];
                                    from= snapshotCate.data[1][i]['startdate'];
                                    to= snapshotCate.data[1][i]['enddate'];
                                    return;
                                  }else{
                                    isExist=false;
                                  }
                                }
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
            child: itemData.ReviewPromotion==true?RaisedButton(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),
    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
    onPressed: () async{
      setState(() {
        _isLoading=false;
      });
      final Comptables = await helper.allComOfferData();
      final Ourtables = await helper.allOurOfferData();
      int tallestLength=0;
      Ourtables.length>=Comptables.length?tallestLength=Ourtables.length:tallestLength=Comptables.length;
      for(int i=0;i<tallestLength;i++){
        id=i;
        branchid=itemData.id;
        chain=itemData.selectedPlace;
        branch=itemData.selectedBranch;
        itemnum='';
        catename='';
        subcatename='';
        subBrand='';
        itemname='';
        MainPrice='';
        PormotionReason='';
        pormotiontype='';
        PormotionDetails='';
        startdate='';
        enddate='';
        compid='';
        compcatename='';
        company='';
        compitemname='';
        compMainPrice='';
        compPormotionReason='';
        comppormotiontype='';
        compPormotionDetails='';
        compstartdate='';
        compenddate='';
        if(i<Ourtables.length){
        if(Ourtables[i]['branchid']==itemData.id){
          id=Ourtables[i]['id'];
          branchid=Ourtables[i]['branchid'];
          chain=Ourtables[i]['chain'];
          branch=Ourtables[i]['branch'];
          itemnum=Ourtables[i]['itemnum'];
          catename=Ourtables[i]['catename'];
          subcatename=Ourtables[i]['subcatename'];
          subBrand=Ourtables[i]['subbrand'];
          itemname=Ourtables[i]['itemname'];
          MainPrice=Ourtables[i]['mainprice'];
          PormotionReason=Ourtables[i]['pormotionreason'];
          pormotiontype=Ourtables[i]['pormotiontype'];
          PormotionDetails=Ourtables[i]['pormotiondetail'];
          startdate=Ourtables[i]['startdate'];
          enddate=Ourtables[i]['enddate'];
        }
        }
        if(i>=Ourtables.length){
          id=i;
          branchid=itemData.id;
          chain=itemData.selectedPlace;
          branch=itemData.selectedBranch;
          itemnum='';
          catename='';
          subcatename='';
          subBrand='';
          itemname='';
          MainPrice='';
          PormotionReason='';
          pormotiontype='';
          PormotionDetails='';
          startdate='';
          enddate='';
        }
        if(i<Comptables.length){
        if(Comptables[i]['branchid']==itemData.id){
          compid=Comptables[i]['id'].toString();
          compcatename=Comptables[i]['catename'];
          company=Comptables[i]['company'];
          compitemname=Comptables[i]['ItemName'];
          compMainPrice=Comptables[i]['mainprice'];
          compPormotionReason=Comptables[i]['pormotionreason'];
          comppormotiontype=Comptables[i]['pormotiontype'];
          compPormotionDetails=Comptables[i]['pormotiondetail'];
          compstartdate=Comptables[i]['startdate'];
          compenddate=Comptables[i]['enddate'];
        }
        }
        if(i>=Comptables.length){
          compid='';
          compcatename='';
          company='';
          compitemname='';
          compMainPrice='';
          compPormotionReason='';
          comppormotiontype='';
          compPormotionDetails='';
          compstartdate='';
          compenddate='';
        }
        if(branchid==itemData.id){
          dbAllOfferData AOD=dbAllOfferData(
            id: id,branchid:branchid,chain:chain, branch: branch,itemnum: itemnum, catename: catename, subcatename: subcatename,
            subBrand: subBrand, itemname: itemname, MainPrice: MainPrice, PormotionReason: PormotionReason,
            pormotiontype: pormotiontype, PormotionDetails: PormotionDetails,startdate: startdate, enddate: enddate,
            compid: compid, compcatename: compcatename, company: company, compitemname: compitemname, compMainPrice: compMainPrice,
            compPormotionReason: compPormotionReason, comppormotiontype: comppormotiontype, compPormotionDetails: compPormotionDetails,
            compstartdate: compstartdate, compenddate: compenddate,
          );
          await helper.createAllOfferData(AOD);
        }
      }
      final Alltables= await helper.allAllOfferData();
      for(int i=0;i<Alltables.length;i++){
        print(Alltables[i]);
          await Future.delayed(const Duration(seconds: 2));
          itemData.submitOfferForm(OfferDataSheet(
            branchid: Alltables[i]['branchid'],
            chain: Alltables[i]['chain'],
            branch: Alltables[i]['branch'],
            itemnum: Alltables[i]['itemnum'],
            catename: Alltables[i]['catename'],
            subcatename: Alltables[i]['subcatename'],
            subBrand: '',
            itemname: Alltables[i]['itemname'],
            MainPrice: Alltables[i]['mainprice'],
            PormotionReason: Alltables[i]['pormotionreason'],
            pormotiontype: Alltables[i]['pormotiontype'],
            PormotionDetails: Alltables[i]['pormotiondetail'],
            startdate: Alltables[i]['startdate'],
            enddate: Alltables[i]['enddate'],
            compcatename: Alltables[i]['compcatename'],
            company: Alltables[i]['company'],
            compitemname: Alltables[i]['compitemname'],
            compMainPrice: Alltables[i]['compMainPrice'],
            compPormotionReason: Alltables[i]['compPormotionReason'],
            comppormotiontype: Alltables[i]['comppormotiontype'],
            compPormotionDetails: Alltables[i]['compPormotionDetails'],
            compstartdate: Alltables[i]['compstartdate'],
            compenddate: Alltables[i]['compenddate'],
                ), (String response) async {
                  print("Response:$response");
                });
      }
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      await helper.clearAllOfferDataPreviousDay();
      await helper.clearOurOfferDataPreviousDay();
      await helper.clearComOfferDataPreviousDay();
      await helper.clearOurOfferCatePreviousDay();
      await helper.clearComOfferCatePreviousDay();
    },
    padding: EdgeInsets.all(10.0),
    color: Color.fromRGBO(0, 160, 227, 1),
    textColor: Colors.white,
    child:Text('Upload Promotion Report'),
    ) :RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
              onPressed: () async{
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              /* /* setState(() {
                  _isLoading=true;
                });*/
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
                  }else if(Comptables[i]['catename']=='Coffe'&&itemData.selectedCategory=='NESCAFE'&&Comptables[i]['branchid']==itemData.id){
                    CompLength++;
                  }else if(Comptables[i]['catename']=='Chocolate'&&itemData.selectedCategory=='Biscuits'&&Comptables[i]['branchid']==itemData.id){
                    CompLength++;
                  }
                }

                if(OurLength>CompLength){
                  print('${CompLength}+${OurLength}');
                for(int i=0;i<Ourtables.length;i++){
                  if(Ourtables[i]['catename']==itemData.selectedCategory&&Ourtables[i]['branchid']==itemData.id){
                    //print(Ourtables[i]);
                     id=Ourtables[i]['id'];
                     branchid=Ourtables[i]['branchid'];
                     chain=Ourtables[i]['chain'];
                     branch=Ourtables[i]['branch'];
                     itemnum=Ourtables[i]['itemnum'];
                     catename=Ourtables[i]['catename'];
                     subcatename=Ourtables[i]['subcatename'];
                     subBrand=Ourtables[i]['subbrand'];
                     itemname=Ourtables[i]['itemname'];
                     MainPrice=Ourtables[i]['mainprice'];
                     PormotionReason=Ourtables[i]['pormotionreason'];
                     pormotiontype=Ourtables[i]['pormotiontype'];
                     PormotionDetails=Ourtables[i]['pormotiondetail'];
                     startdate=Ourtables[i]['startdate'];
                     enddate=Ourtables[i]['enddate'];
                  }
                  if(i<Comptables.length) {
                    if (Comptables[i]['catename'] == itemData.selectedCategory && Comptables[i]['branchid'] == itemData.id) {
                      //print(Comptables[i]);
                       compid=Comptables[i]['id'].toString();
                       compcatename=Comptables[i]['catename'];
                       company=Comptables[i]['company'];
                       compitemname=Comptables[i]['ItemName'];
                       compMainPrice=Comptables[i]['mainprice'];
                       compPormotionReason=Comptables[i]['pormotionreason'];
                       comppormotiontype=Comptables[i]['pormotiontype'];
                       compPormotionDetails=Comptables[i]['pormotiondetail'];
                       compstartdate=Comptables[i]['startdate'];
                       compenddate=Comptables[i]['enddate'];
                    } else if (Comptables[i]['catename'] == 'Coffe' && Comptables[i]['branchid'] == itemData.id) {
                      //print(Comptables[i]);
                      compid=Comptables[i]['id'].toString();
                      compcatename=Comptables[i]['catename'];
                      company=Comptables[i]['company'];
                      compitemname=Comptables[i]['ItemName'];
                      compMainPrice=Comptables[i]['mainprice'];
                      compPormotionReason=Comptables[i]['pormotionreason'];
                      comppormotiontype=Comptables[i]['pormotiontype'];
                      compPormotionDetails=Comptables[i]['pormotiondetail'];
                      compstartdate=Comptables[i]['startdate'];
                      compenddate=Comptables[i]['enddate'];
                    } else if (Comptables[i]['catename'] == 'Chocolate' && Comptables[i]['branchid'] == itemData.id) {
                      //print(Comptables[i]);
                      compid=Comptables[i]['id'].toString();
                      compcatename=Comptables[i]['catename'];
                      company=Comptables[i]['company'];
                      compitemname=Comptables[i]['ItemName'];
                      compMainPrice=Comptables[i]['mainprice'];
                      compPormotionReason=Comptables[i]['pormotionreason'];
                      comppormotiontype=Comptables[i]['pormotiontype'];
                      compPormotionDetails=Comptables[i]['pormotiondetail'];
                      compstartdate=Comptables[i]['startdate'];
                      compenddate=Comptables[i]['enddate'];
                    }
                  }else{
                    //print('comp Ended');
                    compid='';
                    compcatename='';
                    company='';
                    compitemname='';
                    compMainPrice='';
                    compPormotionReason='';
                    comppormotiontype='';
                    compPormotionDetails='';
                    compstartdate='';
                    compenddate='';
                  }
                  if(Ourtables[i]['catename']==itemData.selectedCategory&&Ourtables[i]['branchid']==itemData.id){
                  dbAllOfferData AOD=dbAllOfferData(
                    id: id,branchid:branchid,chain:chain, branch: branch,itemnum: itemnum, catename: catename, subcatename: subcatename,
                    subBrand: subBrand, itemname: itemname, MainPrice: MainPrice, PormotionReason: PormotionReason,
                    pormotiontype: pormotiontype, PormotionDetails: PormotionDetails,startdate: startdate, enddate: enddate,
                    compid: compid, compcatename: compcatename, company: company, compitemname: compitemname, compMainPrice: compMainPrice,
                    compPormotionReason: compPormotionReason, comppormotiontype: comppormotiontype, compPormotionDetails: compPormotionDetails,
                    compstartdate: compstartdate, compenddate: compenddate,
                  );
                  await helper.createAllOfferData(AOD);
                  }
                }
                final Alltables=await helper.allAllOfferData();
                for(int i=0;i< Alltables.length;i++){
                  if(Alltables[i]['catename']==itemData.selectedCategory&&Ourtables[i]['branchid']==itemData.id){
                    print(Alltables[i]);
                  /*  await Future.delayed(const Duration(seconds: 2));
                  itemData.submitOfferForm(OfferDataSheet(
                    branchid: Alltables[i]['branchid'],
                    chain: Alltables[i]['chain'],
                    branch: Alltables[i]['branch'],
                    itemnum: Alltables[i]['itemnum'],
                    catename: Alltables[i]['catename'],
                    subcatename: Alltables[i]['subcatename'],
                    subBrand: '',
                    itemname: Alltables[i]['itemname'],
                    MainPrice: Alltables[i]['mainprice'],
                    PormotionReason: Alltables[i]['pormotionreason'],
                    pormotiontype: Alltables[i]['pormotiontype'],
                    PormotionDetails: Alltables[i]['pormotiondetail'],
                    startdate: Alltables[i]['startdate'],
                    enddate: Alltables[i]['enddate'],
                    compcatename: Alltables[i]['compcatename'],
                    company: Alltables[i]['company'],
                    compitemname: Alltables[i]['compitemname'],
                    compMainPrice: Alltables[i]['compMainPrice'],
                    compPormotionReason: Alltables[i]['compPormotionReason'],
                    comppormotiontype: Alltables[i]['comppormotiontype'],
                    compPormotionDetails: Alltables[i]['compPormotionDetails'],
                    compstartdate: Alltables[i]['compstartdate'],
                    compenddate: Alltables[i]['compenddate'],
                ), (String response) async {
                  print("Response:$response");
                  setState(() {
                    _isLoading=false;
                  });
                });*/
                  }
                }
                }else{
                  for(int i=0;i<Comptables.length;i++){
                    if(Comptables[i]['catename']==itemData.selectedCategory&&Comptables[i]['branchid']==itemData.id){
                      compid=Comptables[i]['id'].toString();
                      compcatename=Comptables[i]['catename'];
                      company=Comptables[i]['company'];
                      compitemname=Comptables[i]['ItemName'];
                      compMainPrice=Comptables[i]['mainprice'];
                      compPormotionReason=Comptables[i]['pormotionreason'];
                      comppormotiontype=Comptables[i]['pormotiontype'];
                      compPormotionDetails=Comptables[i]['pormotiondetail'];
                      compstartdate=Comptables[i]['startdate'];
                      compenddate=Comptables[i]['enddate'];
                    }else if (Comptables[i]['catename'] == 'Coffe' && Comptables[i]['branchid'] == itemData.id) {
                      //print(Comptables[i]);
                      compid=Comptables[i]['id'].toString();
                      compcatename=Comptables[i]['catename'];
                      company=Comptables[i]['company'];
                      compitemname=Comptables[i]['ItemName'];
                      compMainPrice=Comptables[i]['mainprice'];
                      compPormotionReason=Comptables[i]['pormotionreason'];
                      comppormotiontype=Comptables[i]['pormotiontype'];
                      compPormotionDetails=Comptables[i]['pormotiondetail'];
                      compstartdate=Comptables[i]['startdate'];
                      compenddate=Comptables[i]['enddate'];
                    } else if (Comptables[i]['catename'] == 'Chocolate' && Comptables[i]['branchid'] == itemData.id) {
                      //print(Comptables[i]);
                      compid=Comptables[i]['id'].toString();
                      compcatename=Comptables[i]['catename'];
                      company=Comptables[i]['company'];
                      compitemname=Comptables[i]['ItemName'];
                      compMainPrice=Comptables[i]['mainprice'];
                      compPormotionReason=Comptables[i]['pormotionreason'];
                      comppormotiontype=Comptables[i]['pormotiontype'];
                      compPormotionDetails=Comptables[i]['pormotiondetail'];
                      compstartdate=Comptables[i]['startdate'];
                      compenddate=Comptables[i]['enddate'];
                    }
                    if(i<Ourtables.length){
                      id=Ourtables[i]['id'];
                      branchid=Ourtables[i]['branchid'];
                      chain=Ourtables[i]['chain'];
                      branch=Ourtables[i]['branch'];
                      itemnum=Ourtables[i]['itemnum'];
                      catename=Ourtables[i]['catename'];
                      subcatename=Ourtables[i]['subcatename'];
                      subBrand=Ourtables[i]['subbrand'];
                      itemname=Ourtables[i]['itemname'];
                      MainPrice=Ourtables[i]['mainprice'];
                      PormotionReason=Ourtables[i]['pormotionreason'];
                      pormotiontype=Ourtables[i]['pormotiontype'];
                      PormotionDetails=Ourtables[i]['pormotiondetail'];
                      startdate=Ourtables[i]['startdate'];
                      enddate=Ourtables[i]['enddate'];
                    }else{
                      id=Comptables[i]['id'];
                      branchid=itemData.id;
                      chain=itemData.selectedPlace;
                      branch=itemData.selectedBranch;
                      itemnum='';
                      catename=itemData.selectedCategory;
                      subcatename='';
                      subBrand='';
                      itemname='';
                      MainPrice='';
                      PormotionReason='';
                      pormotiontype='';
                      PormotionDetails='';
                      startdate='';
                      enddate='';
                    }
                  if(Ourtables[i]['catename']==itemData.selectedCategory&&Ourtables[i]['branchid']==itemData.id) {
                    dbAllOfferData AOD = dbAllOfferData(
                      id: id,
                      branchid: branchid,
                      chain: chain,
                      branch: branch,
                      itemnum: itemnum,
                      catename: catename,
                      subcatename: subcatename,
                      subBrand: subBrand,
                      itemname: itemname,
                      MainPrice: MainPrice,
                      PormotionReason: PormotionReason,
                      pormotiontype: pormotiontype,
                      PormotionDetails: PormotionDetails,
                      startdate: startdate,
                      enddate: enddate,
                      compid: compid,
                      compcatename: compcatename,
                      company: company,
                      compitemname: compitemname,
                      compMainPrice: compMainPrice,
                      compPormotionReason: compPormotionReason,
                      comppormotiontype: comppormotiontype,
                      compPormotionDetails: compPormotionDetails,
                      compstartdate: compstartdate,
                      compenddate: compenddate,
                    );
                    await helper.createAllOfferData(AOD);
                  }
                  }
                  final Alltables=await helper.allAllOfferData();
                  for(int i=0;i< Alltables.length;i++){
                    if(Alltables[i]['catename']==itemData.selectedCategory&&Ourtables[i]['branchid']==itemData.id){
                      print(Alltables[i]);
                     /* await Future.delayed(const Duration(seconds: 2));
                      itemData.submitOfferForm(OfferDataSheet(
                        branchid: Alltables[i]['branchid'],
                        chain: Alltables[i]['chain'],
                        branch: Alltables[i]['branch'],
                        itemnum: Alltables[i]['itemnum'],
                        catename: Alltables[i]['catename'],
                        subcatename: Alltables[i]['subcatename'],
                        subBrand: '',
                        itemname: Alltables[i]['itemname'],
                        MainPrice: Alltables[i]['mainprice'],
                        PormotionReason: Alltables[i]['pormotionreason'],
                        pormotiontype: Alltables[i]['pormotiontype'],
                        PormotionDetails: Alltables[i]['pormotiondetail'],
                        startdate: Alltables[i]['startdate'],
                        enddate: Alltables[i]['enddate'],
                        compcatename: Alltables[i]['compcatename'],
                        company: Alltables[i]['company'],
                        compitemname: Alltables[i]['compitemname'],
                        compMainPrice: Alltables[i]['compMainPrice'],
                        compPormotionReason: Alltables[i]['compPormotionReason'],
                        comppormotiontype: Alltables[i]['comppormotiontype'],
                        compPormotionDetails: Alltables[i]['compPormotionDetails'],
                        compstartdate: Alltables[i]['compstartdate'],
                        compenddate: Alltables[i]['compenddate'],
                      ), (String response) async {
                        print("Response:$response");
                        setState(() {
                          _isLoading=false;
                        });
                      });*/
                    }
                  }
                }*/
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
