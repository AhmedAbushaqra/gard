import 'package:gard/Branches.dart';
import 'package:flutter/material.dart';
import 'package:gard/Items.dart';
import 'package:gard/models/chainModel.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/Category.dart';
import 'package:gard/widgets/grid_view_item.dart';
import 'package:provider/provider.dart';

//https://script.google.com/macros/s/AKfycbz6KOa6RIj8Qfdjl5KdKzXC0jZnT4-seCbrCCen45cw0q1LZGRxEFAoSZBShL3vFNZVFw/exec

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Chains>(
      create: (context)=>Chains(),
      child: MaterialApp(
        home: Home(),
        routes: {
          Branches.RouteName:(ctx)=>Branches(),
          Category.RouteName:(ctx)=>Category(),
          Items.RouteName:(ctx)=>Items(),
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
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
    );
  }
}