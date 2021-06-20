import 'package:flutter/material.dart';
import 'package:gard/Category.dart';
import 'package:gard/OffersScreen.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/models/db_catesend.dart';
import 'package:gard/models/final_data.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/List_View_Item_Items.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'package:gard/translation/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class Items extends StatefulWidget {
  static const RouteName = "/Item";

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  DbHelper helper=DbHelper();
  bool _isLoading=false;
  String cateOfferName;

  var transItems=[];
  var bonTransName=[LocaleKeys.Khamsina2in1.tr(),LocaleKeys.mehaweg6gm.tr(),LocaleKeys.in1Bon.tr(),LocaleKeys.in1Huzelnut.tr(),
    LocaleKeys.in1Jar400gEg.tr(),LocaleKeys.mocha.tr(),LocaleKeys.latte.tr(), LocaleKeys.Hazelnut.tr(),LocaleKeys.latteCaramel.tr(),
    LocaleKeys.vanilla.tr(),LocaleKeys.latteCinnamonCocoa.tr(),];

  var NescTrans=[LocaleKeys.NescClassic18g.tr(),LocaleKeys.NescPouch18g.tr(),LocaleKeys.NescClassic50g.tr(),LocaleKeys.CL200Pouch.tr(),
    LocaleKeys.Nescpouch50g.tr(),LocaleKeys.NescClassic100g.tr(),LocaleKeys.NescClassic200g.tr(),LocaleKeys.NescClassic200gRedMug.tr(),
    LocaleKeys.NescClassicCreama100g.tr(),LocaleKeys.NescG100g.tr(),LocaleKeys.NescG200g.tr(),LocaleKeys.NescG50g.tr(),
    LocaleKeys.NescGoldDcf100g.tr(),LocaleKeys.NescEspresso100g.tr(),LocaleKeys.NescEspressoRichCream100g.tr(),
    LocaleKeys.NescGoldColombia100g.tr(),LocaleKeys.NescGoldAltarica100G.tr(),LocaleKeys.NescGoldStick18g.tr(),
    LocaleKeys.NescEspressp18g.tr(),LocaleKeys.NescGoldDecf100gpriceoff.tr(),LocaleKeys.Nesc2in1stick24.tr(),
    LocaleKeys.Nesc2in1stick12.tr(),LocaleKeys.Nesc3in1.tr(),LocaleKeys.Nesc3in1RICH.tr(),LocaleKeys.NescGold3in1.tr(),
    LocaleKeys.Arabiana.tr(),LocaleKeys.Nesc3IN1Hzn.tr(),LocaleKeys.Nesc3in1Choc.tr(),LocaleKeys.Nesc3in1Caramel.tr(),
    LocaleKeys.Nesc3in1Milk.tr(),LocaleKeys.Nesc3in1Ice.tr(),LocaleKeys.Nesc3in1SaltedCrml.tr(),LocaleKeys.Nesc3in1Vanilla.tr(),
    LocaleKeys.GoldSweet.tr(),LocaleKeys.GoldLatte.tr(),LocaleKeys.GoldVanilla.tr(),LocaleKeys.GoldMocha.tr(),
    LocaleKeys.GoldCaramel.tr(),];

  var coffeemateTrans=[LocaleKeys.g400.tr(),LocaleKeys.g170.tr(),LocaleKeys.CFMTMATE.tr(),];
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Builder(
      builder : (BuildContext context){
    final ItemData=Provider.of<Chains>(context);
    ItemData.selectedCategory=='BONJORNO'?transItems=bonTransName:
    ItemData.selectedCategory=='NESCAFE'?transItems=NescTrans:
    ItemData.selectedCategory=='COFFEE-MATE'?transItems=coffeemateTrans:transItems=transItems;
    return Scaffold(
      body:_isLoading?Center(child: CircularProgressIndicator()):ListView.builder(
          padding: EdgeInsets.only(bottom: 70,top: 25),
          itemBuilder: (ctx,index)=>ItemsListView(
            ItemData.subCategory[index]['id'],
            ItemData.subCategory[index]['Itemname'],
            ItemData.selectedCategory=='BONJORNO'||ItemData.selectedCategory=='NESCAFE'||ItemData.selectedCategory=='COFFEE-MATE'
                ?transItems[index]:ItemData.subCategory[index]['Itemname'],
            ItemData.subCategory[index]['MainPCateName'],
            ItemData.subCategory[index]['imgUrl'],
            ItemData.subCategory[index]['SubCate'],
          ),
          itemCount: ItemData.subCategory.length,
        ),
      floatingActionButton: _isLoading?SizedBox():FloatingActionButton.extended(
        onPressed: ()async {
          if(ItemData.selectedCategory=='NESCAFE'){
            cateOfferName='Coffee';
          }else if(ItemData.selectedCategory=='Biscuits'){
            cateOfferName='Chocolate';
          }else{
            cateOfferName=ItemData.selectedCategory;
          }
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
      print(items);
      print(ItemData.subCategory.length);
      if(items==ItemData.subCategory.length) {
        Catesend CD = Catesend(
            branchid: ItemData.id,
            cate: ItemData.selectedCategory);
        int id = await helper.createcatesend(CD);
        print(id);
        _isLoading = false;
        Navigator.of(context).pop();
        Navigator.of(context).popAndPushNamed(Category.RouteName);
        if (ItemData.selectedCategory == 'BONJORNO'||ItemData.selectedCategory=='CONFECTIONERY') {
        }else{
        await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('Offers'),
              content: Text(
                  'There is any Offers in  $cateOfferName'),
              actions: [
                FlatButton(onPressed: () async{
                  ItemData.ReviewPromotion=false;
                  Navigator.of(ctx).pushNamed(OffersScreen.RouteName);
                  final tables = await helper.allOurOfferData();
                  if(tables.isNotEmpty) {
                    for (int i = 0; i < tables.length; i++) {
                      ItemData.AddOurOfferItemId(tables[i]['id'].toString());
                    }
                  }
                }, child: Text('Yes')),
                FlatButton(onPressed: () {
                  Navigator.of(ctx).pop();
                }, child: Text('No'))
              ],
            )
        );
        }
           }else{
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
