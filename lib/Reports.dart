import 'package:flutter/material.dart';
import 'package:gard/extra_vis_screen.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:provider/provider.dart';

import 'Category.dart';

class Reports extends StatelessWidget {
  static const RouteName = "/Reports";
  @override
  Widget build(BuildContext context) {
    final reportType=Provider.of<Chains>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.all(10),
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                onPressed: () {
                  Navigator.of(context).pushNamed(Category.RouteName);
                  reportType.reportType='P.O.S';
                },
                padding: EdgeInsets.all(10.0),
                color: Color.fromRGBO(0, 160, 227, 1),
                textColor: Colors.white,
                child: Text("Stock Status",
                    style: TextStyle(fontSize: 15)),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                onPressed: () {
                  Navigator.of(context).pushNamed(ExtraVisScreen.RouteName);
                  reportType.reportType='Extra Vis.';
                },
                padding: EdgeInsets.all(10.0),
                color: Color.fromRGBO(0, 160, 227, 1),
                textColor: Colors.white,
                child: Text("Extra Vis.",
                    style: TextStyle(fontSize: 15)),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                onPressed: () {
                  Navigator.of(context).pushNamed(Category.RouteName);
                  reportType.reportType='Expire Report';
                },
                padding: EdgeInsets.all(10.0),
                color: Color.fromRGBO(0, 160, 227, 1),
                textColor: Colors.white,
                child: Text("Expire Report",
                    style: TextStyle(fontSize: 15)),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                color: Color.fromRGBO(0, 160, 227, 1),
                textColor: Colors.white,
                child: Text("Main Price V.S Competitor",
                    style: TextStyle(fontSize: 15)),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                color: Color.fromRGBO(0, 160, 227, 1),
                textColor: Colors.white,
                child: Text("Promotion V.S Competitor",
                    style: TextStyle(fontSize: 15)),
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
