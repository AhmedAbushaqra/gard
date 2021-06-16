import 'package:flutter/material.dart';
import 'package:gard/ExpiryItem.dart';
import 'package:gard/OffersScreen.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/extra_vis_screen.dart';
import 'package:gard/models/ExpiryData.dart';
import 'package:gard/models/chainModel.dart';
import 'package:gard/models/db_catesend.dart';
import 'package:gard/models/final_data.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'CategoryListShape.dart';
import 'Items.dart';
import 'package:gard/translation/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class Category extends StatefulWidget {
  static const RouteName = "/selectItem";

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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

  List<Chain> CategoryList = [];

  var transName=[LocaleKeys.Bonjorno.tr(),LocaleKeys.Nescafe.tr(),LocaleKeys.CoffeMate.tr(),LocaleKeys.Nido.tr(),LocaleKeys.BabyFood.tr(),
    'Nesquik',LocaleKeys.RTD.tr(),LocaleKeys.Maggi.tr(),LocaleKeys.Cereal.tr(),LocaleKeys.Confec.tr(),LocaleKeys.Bisqu.tr(),
    LocaleKeys.water.tr(),];

  DbHelper helper;
  bool isLoading=false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper=DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    final categoryData=Provider.of<Chains>(context);
    String reportType=categoryData.reportType;
    return Scaffold(
      body: Container(
        child: Scrollbar(
          thickness: 3,
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05,bottom: categoryData.reportType=='Expire Report'?55:1),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  FutureBuilder(
                    future: Future.wait([helper.allCatesend(),helper.allCatesendsheet()]),
                    builder: (context, AsyncSnapshot snapshot){
                        if (!snapshot.hasData) {
                             return Center(child: CircularProgressIndicator(),);
                        }else{
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(10),
                            itemCount: categoryData.Category.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:2,
                              childAspectRatio: 3/2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (ctx,i)=>CategoryListShape(categoryData.Category[i]['cateName'],transName[i],categoryData.Category[i]['cateImage'],),
                          );
                        }
                    }
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width*0.5,
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                      onPressed: () {
                        categoryData.ReviewPromotion=true;
                        Navigator.of(context).pushNamed(OffersScreen.RouteName);
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Color.fromRGBO(0, 160, 227, 1),
                      textColor: Colors.white,
                      child: Text("Promotion Report",
                          style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
