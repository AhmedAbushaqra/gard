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
      path: 'assets/translations', // <-- change patch to your
      fallbackLocale: Locale('en'),
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

  @override
  Widget build(BuildContext context) {
    final chainData=Provider.of<Chains>(context);
    return Scaffold(
      body:  Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: chainData.places.length,
          itemBuilder: (ctx,i)=>GridViewItem(chainData.places[i]['id'],chainData.places[i]['name'],chainData.places[i]['imgUrl'],),
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