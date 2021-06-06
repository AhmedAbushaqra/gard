import 'package:flutter/material.dart';
import 'package:gard/extra_vis_screen.dart';
import 'package:gard/models/empLogin.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'Category.dart';

class Reports extends StatefulWidget {
  static const RouteName = "/Reports";

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    final reportType=Provider.of<Chains>(context);
    return Scaffold(
      body:_isLoading? Center(child: CircularProgressIndicator(),):Padding(
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
                    side: BorderSide(color: Colors.red)),
                onPressed: () {
                  setState(() {
                    _isLoading=true;
                  });
                  reportType.submitLogOut(empLogIn(
                    code: reportType.empcode,
                    date: DateFormat.yMd().format(DateTime.now()),
                    name: reportType.empname,
                    chain: reportType.selectedPlace,
                    branchid: reportType.id,
                    branch: reportType.selectedBranch,
                    logintime: DateFormat.Hms().format(DateTime.now()),
                  ), (String response) async {
                    await print("Response:$response");
                    if (response=='SUCCESS') {
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }else{
                      setState(() {
                        _isLoading = false;
                      });
                      await showDialog(
                          context: context,
                          builder: (ctx) =>
                              AlertDialog(
                                title: Text('An Error Occurred'),
                                content: Text(
                                    'Check internet Connection'),
                                actions: [
                                  FlatButton(onPressed: () {
                                    Navigator.of(ctx).pop();
                                  }, child: Text('OK'))
                                ],
                              )
                      );
                    }
                  });
                },
                padding: EdgeInsets.all(10.0),
                color: Colors.red,
                textColor: Colors.white,
                child: Text("Log Out",
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
