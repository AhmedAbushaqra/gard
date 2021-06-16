import 'package:gard/Branches.dart';
import 'package:flutter/material.dart';
import 'package:gard/Charts.dart';
import 'package:gard/Charts/Bon.MissChart.dart';
import 'package:gard/Charts/CategoryMissChart.dart';
import 'package:gard/Charts/KherZman.MissChart.dart';
import 'package:gard/Charts/selectCategoryChart.dart';
import 'package:gard/CompetitorOfferScreen.dart';
import 'package:gard/ExpiryItem.dart';
import 'package:gard/Items.dart';
import 'package:gard/LogIn.dart';
import 'package:gard/OffersScreen.dart';
import 'package:gard/Reports.dart';
import 'package:gard/local_notification.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/Category.dart';
import 'package:gard/splash_screen.dart';
import 'package:gard/translation/codegen_loader.g.dart';
import 'package:gard/translation/locale_keys.g.dart';
import 'package:gard/widgets/grid_view_item.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';
import 'Charts/ChainMissChart.dart';
import 'extra_vis_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

//https://script.google.com/macros/s/AKfycbz6KOa6RIj8Qfdjl5KdKzXC0jZnT4-seCbrCCen45cw0q1LZGRxEFAoSZBShL3vFNZVFw/exec

void main() async{
  runApp( EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translation', // <-- change patch to your
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: MyApp()
  ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Chains>(
      create: (context)=>Chains(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: SplashScreen(),
        routes: {
          SplashScreen.RouteName: (ctx)=>SplashScreen(),
          LogoScreen.RouteName: (ctx)=>LogoScreen(),
          Home.RouteName: (ctx)=> Home(),
          Branches.RouteName:(ctx)=>Branches(),
          Category.RouteName:(ctx)=>Category(),
          Items.RouteName:(ctx)=>Items(),
          Reports.RouteName:(ctx)=>Reports(),
          ExpireItems.RouteName:(ctx)=>ExpireItems(),
          LogIn.RouteName:(ctx)=>LogIn(),
          Charts.RouteName:(ctx)=>Charts(),
          SelectCategoryChart.RouteName:(ctx)=>SelectCategoryChart(),
          CategoryMissChart.RouteName:(ctx)=>CategoryMissChart(),
          ChainMissChart.RouteName:(ctx)=>ChainMissChart(),
          Bon_MissChart.RouteName:(ctx)=>Bon_MissChart(),
          Kher_MissChart.RouteName:(ctx)=>Kher_MissChart(),
          ExtraVisScreen.RouteName:(ctx)=>ExtraVisScreen(),
          OffersScreen.RouteName:(ctx)=>OffersScreen(),
          CompetitorOffersScreen.RouteName:(ctx)=>CompetitorOffersScreen(),
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  static const RouteName = "/home_screen";
  var placeNames=[
    {
      'id':'1',
      'trans':LocaleKeys.Carrfour.tr(),
      'name':'Carrefour',
      'imgUrl':'images/Carrefour.jpeg'
    },
    {
      'id':'2',
      'trans':LocaleKeys.CarrfourExpress.tr(),
      'name':'Carrefour Express',
      'imgUrl':'images/CarrefourExpress.jpeg'
    },
    {
      'id':'3',
      'trans':LocaleKeys.hipperOne.tr(),
      'name':'Hipper one',
      'imgUrl':'images/HipperOne.jpeg'
    },
    {
      'id':'4',
      'trans':LocaleKeys.Spinnyes.tr(),
      'name':'Spinneys',
      'imgUrl':'images/Spinneys.jpeg'
    },
    {
      'id':'5',
      'trans':LocaleKeys.Seoudi.tr(),
      'name':'Seoudi',
      'imgUrl':'images/Seoudi.jpeg'
    },
    {
      'id':'6',
      'trans':LocaleKeys.RagabSons.tr(),
      'name':'Ragab sons',
      'imgUrl':'images/RagabSons.jpeg'
    },
    {
      'id':'7',
      'trans':LocaleKeys.Metro.tr(),
      'name':'Metro',
      'imgUrl':'images/Metro.jpeg'
    },
    {
      'id':'8',
      'trans':LocaleKeys.KherZaman.tr(),
      'name':'Kher zaman',
      'imgUrl':'images/kher.jpeg'
    },
    {
      'id':'9',
      'trans':LocaleKeys.ELOtheim.tr(),
      'name':'El otheim',
      'imgUrl':'images/othaim.jpeg'
    },
    {
      'id':'10',
      'trans':LocaleKeys.raya.tr(),
      'name':'Raya',
      'imgUrl':'images/raya.jpeg'
    },
    {
      'id':'11',
      'trans':LocaleKeys.alfa.tr(),
      'name':'Alfa',
      'imgUrl':'images/alpha.jpeg'
    },
    {
      'id':'12',
      'trans':LocaleKeys.Elmahalawy.tr(),
      'name':'El Mahalawy',
      'imgUrl':'images/mahlawy.jpeg'
    },
    {
      'id':'13',
      'trans':LocaleKeys.panda.tr(),
      'name':'Panda',
      'imgUrl':'images/panda.jpeg'
    },
    {
      'id':'14',
      'trans':LocaleKeys.Elhawary.tr(),
      'name':'El Hawary',
      'imgUrl':'images/hawary.jpeg'
    },
    {
      'id':'15',
      'trans':LocaleKeys.oscar.tr(),
      'name':'Oscar',
      'imgUrl':'images/oscar.jpeg'
    },
    {
      'id':'16',
      'trans':LocaleKeys.lulu.tr(),
      'name':'Lulu',
      'imgUrl':'images/lulu.jpeg'
    },
    {
      'id':'17',
      'trans':LocaleKeys.FAthallaGomla.tr(),
      'name':'Fathalla Gomla',
      'imgUrl':'images/fatgomla.jpeg'
    },
    {
      'id':'18',
      'trans':LocaleKeys.BeitElgomal.tr(),
      'name':'Beit el gomla',
      'imgUrl':'images/biet.jpeg'
    },
    {
      'id':'19',
      'trans':LocaleKeys.AswaqFathalla.tr(),
      'name':'Aswaq Fathalla',
      'imgUrl':'images/aswaqfat.jpeg'
    },
    {
      'id':'20',
      'trans':LocaleKeys.AswaqFathallamini.tr(),
      'name':'Aswak fathalla mini',
      'imgUrl':'images/aswaqfat.jpeg'
    },
    {
      'id':'21',
      'trans':LocaleKeys.Zahran.tr(),
      'name':'Zahran',
      'imgUrl':'images/zahran.jpeg'
    },
    {
      'id':'22',
      'trans':LocaleKeys.freshfood.tr(),
      'name':'Fresh food',
      'imgUrl':'images/fresh.jpeg'
    },
    {
      'id':'23',
      'trans':LocaleKeys.RoyalHouse.tr(),
      'name':'Royal house',
      'imgUrl':'images/royal.jpeg'
    },
    {
      'id':'24',
      'trans':LocaleKeys.Martville.tr(),
      'name':'Mart ville',
      'imgUrl':'images/mart.jpeg'
    },
    {
      'id':'25',
      'trans':LocaleKeys.Premier.tr(),
      'name':'Premier',
      'imgUrl':'images/premier.jpeg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final chainData=Provider.of<Chains>(context);
    return Scaffold(
      body:  Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: chainData.places.length,
          itemBuilder: (ctx,i)=>GridViewItem(chainData.places[i]['id'],chainData.places[i]['name'],placeNames[i]['trans'],chainData.places[i]['imgUrl'],),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
         Navigator.of(context).pushNamed(Charts.RouteName);
        },
        icon: Icon(Icons.save),
        label: Text("get data"),
      ),*/
    );
  }
}