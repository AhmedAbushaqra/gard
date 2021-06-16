import 'package:flutter/material.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/Category.dart';
import 'package:gard/widgets/List_View_Item.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gard/translation/locale_keys.g.dart';

class Branches extends StatelessWidget {
  static const RouteName = "/Category";

  var transItems=[];
  var CarfourTransName=[LocaleKeys.CarMaadi.tr(),LocaleKeys.CarMallofegypt.tr(),LocaleKeys.CarCfc.tr(),LocaleKeys.CarAlmaza.tr(),
    LocaleKeys.CarDandyMall.tr(),LocaleKeys.CarAlobor.tr(),LocaleKeys.CarSuncity.tr(),LocaleKeys.CarELshrouq.tr(),
    LocaleKeys.CarMadinaty.tr(),LocaleKeys.CarMoharamBeh.tr(),LocaleKeys.CarALoropa.tr(),LocaleKeys.CarCitylite.tr(),
    LocaleKeys.CarTanta.tr(),LocaleKeys.CarMrakez.tr(),];
  var ZahranTransName=[LocaleKeys.ZahSmouha.tr(),LocaleKeys.ZahZezenia.tr(),LocaleKeys.ZahALmamoura.tr(),
    LocaleKeys.ZahELbetash.tr(),LocaleKeys.ZahDmanhour.tr(),LocaleKeys.ZahMansoura.tr(),];
  var AswaqMiniTransName=[LocaleKeys.MiniSnabel.tr(),LocaleKeys.Minigwaher.tr(),LocaleKeys.MiniSidigaber.tr(),
    LocaleKeys.MiniDekhela2.tr(),LocaleKeys.MiniDekhela1.tr(),];
  @override
  Widget build(BuildContext context) {
    final chainData=Provider.of<Chains>(context);
    chainData.selectedPlace=='Carrefour'?transItems=CarfourTransName:
    chainData.selectedPlace=='Zahran'?transItems=ZahranTransName:
    chainData.selectedPlace=='Aswak fathalla mini'?transItems=AswaqMiniTransName:transItems=transItems;
    return Scaffold(
      body:ListView.builder(
          itemBuilder: (ctx,index)=>ListViewItem(
            chainData.branches[index]['id'],
            chainData.branches[index]['BranchName'],
            chainData.selectedPlace=='Carrefour'||chainData.selectedPlace=='Zahran'||chainData.selectedPlace=='Aswak fathalla mini'
                ?transItems[index]:chainData.branches[index]['BranchName'],
            chainData.imgUrlSelectedPlace,
          ),
        itemCount: chainData.branches.length,
      ),
    );
  }
}