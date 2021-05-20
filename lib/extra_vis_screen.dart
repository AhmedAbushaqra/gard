import 'package:flutter/material.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:provider/provider.dart';

import 'ExpiryItem.dart';

class ExtraVisScreen extends StatelessWidget {
  static const RouteName = "/ExtraVisScreen";

  String stand='Stand';
  String poduim='Poduim';
  String gandola='Gandola';
  String pillar='Pillar';
  String fridge='Fridge';
  String floor='Floor Display';
  String catman='catman';

  @override
  Widget build(BuildContext context) {
    final catagoryData=Provider.of<Chains>(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              margin: EdgeInsets.all(10),
              //width: MediaQuery.of(context).size.width*0.6,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.lightBlue)),
                    onPressed: () {
                      catagoryData.extraVisType=stand;
                      Navigator.of(context).pushNamed(ExpireItems.RouteName);
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Color.fromRGBO(0, 160, 227, 1),
                    textColor: Colors.white,
                    child: Text(stand,
                        style: TextStyle(fontSize: 15)),
                  ),
                  Icon(Icons.send)
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              margin: EdgeInsets.all(10),
              //width: MediaQuery.of(context).size.width*0.6,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.lightBlue)),
                    onPressed: () {
                      catagoryData.extraVisType=poduim;
                      Navigator.of(context).pushNamed(ExpireItems.RouteName);
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Color.fromRGBO(0, 160, 227, 1),
                    textColor: Colors.white,
                    child: Text(poduim,
                        style: TextStyle(fontSize: 15)),
                  ),
                  Icon(Icons.send)
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              margin: EdgeInsets.all(10),
              //width: MediaQuery.of(context).size.width*0.6,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.lightBlue)),
                    onPressed: () {
                      catagoryData.extraVisType=gandola;
                      Navigator.of(context).pushNamed(ExpireItems.RouteName);
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Color.fromRGBO(0, 160, 227, 1),
                    textColor: Colors.white,
                    child: Text(gandola,
                        style: TextStyle(fontSize: 15)),
                  ),
                  Icon(Icons.send)
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              margin: EdgeInsets.all(10),
              //width: MediaQuery.of(context).size.width*0.6,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.lightBlue)),
                    onPressed: () {
                      catagoryData.extraVisType=pillar;
                      Navigator.of(context).pushNamed(ExpireItems.RouteName);
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Color.fromRGBO(0, 160, 227, 1),
                    textColor: Colors.white,
                    child: Text(pillar,
                        style: TextStyle(fontSize: 15)),
                  ),
                  Icon(Icons.send)
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              margin: EdgeInsets.all(10),
              //width: MediaQuery.of(context).size.width*0.6,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.lightBlue)),
                    onPressed: () {
                      catagoryData.extraVisType=fridge;
                      Navigator.of(context).pushNamed(ExpireItems.RouteName);
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Color.fromRGBO(0, 160, 227, 1),
                    textColor: Colors.white,
                    child: Text(fridge,
                        style: TextStyle(fontSize: 15)),
                  ),
                  Icon(Icons.send)
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              margin: EdgeInsets.all(10),
              //width: MediaQuery.of(context).size.width*0.6,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.lightBlue)),
                    onPressed: () {
                      catagoryData.extraVisType=floor;
                      Navigator.of(context).pushNamed(ExpireItems.RouteName);
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Color.fromRGBO(0, 160, 227, 1),
                    textColor: Colors.white,
                    child: Text(floor,
                        style: TextStyle(fontSize: 15)),
                  ),
                  Icon(Icons.send)
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              margin: EdgeInsets.all(10),
              //width: MediaQuery.of(context).size.width*0.6,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.lightBlue)),
                    onPressed: () {
                      catagoryData.extraVisType=catman;
                      Navigator.of(context).pushNamed(ExpireItems.RouteName);
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Color.fromRGBO(0, 160, 227, 1),
                    textColor: Colors.white,
                    child: Text(catman,
                        style: TextStyle(fontSize: 15)),
                  ),
                  Icon(Icons.send)
                ],
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}
