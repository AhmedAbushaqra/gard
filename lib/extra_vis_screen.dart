import 'package:flutter/material.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/models/ExtraCate.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:provider/provider.dart';

import 'ExpiryItem.dart';
import 'models/ExtraData.dart';

class ExtraVisScreen extends StatefulWidget {
  static const RouteName = "/ExtraVisScreen";

  @override
  _ExtraVisScreenState createState() => _ExtraVisScreenState();
}

class _ExtraVisScreenState extends State<ExtraVisScreen> {
  String stand='Stand';

  String poduim='Poduim';

  String gandola='Gandola';

  String pillar='Pillar';

  String fridge='Fridge';

  String floor='Floor Display';

  String catman='catman';

  var _extraItem=ExtraCate(
    id: '',
   extraName: '',
  );
  bool _isLoading=false;
  DbHelper helper=DbHelper();

  @override
  Widget build(BuildContext context) {
    final catagoryData=Provider.of<Chains>(context);
    return Scaffold(
      body: _isLoading?Center(child: CircularProgressIndicator()):Center(
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
                    onPressed: () async{
                      //catagoryData.extraItem.remove(true);
                      final tables = await helper.allExtraData();
                      if(tables.isNotEmpty) {
                        for (int i = 0; i < tables.length; i++) {
                          catagoryData.AddExtraItemId(
                              tables[i]['id'].toString());
                        }
                      }
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
                    onPressed: () async{
                      final tables = await helper.allExtraData();
                      if(tables.isNotEmpty) {
                        for (int i = 0; i < tables.length; i++) {
                          catagoryData.AddExtraItemId(
                              tables[i]['id'].toString());
                        }
                      }
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
                    onPressed: () async {
                      final tables = await helper.allExtraData();
                      if(tables.isNotEmpty) {
                        for (int i = 0; i < tables.length; i++) {
                          catagoryData.AddExtraItemId(
                              tables[i]['id'].toString());
                        }
                      }
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
                    onPressed: () async {
                      final tables = await helper.allExtraData();
                      if(tables.isNotEmpty) {
                        for (int i = 0; i < tables.length; i++) {
                          catagoryData.AddExtraItemId(
                              tables[i]['id'].toString());
                        }
                      }
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
                    onPressed: () async {
                      final tables = await helper.allExtraData();
                      if(tables.isNotEmpty) {
                        for (int i = 0; i < tables.length; i++) {
                          catagoryData.AddExtraItemId(
                              tables[i]['id'].toString());
                        }
                      }
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
                    onPressed: () async {
                      final tables = await helper.allExtraData();
                      if(tables.isNotEmpty) {
                        for (int i = 0; i < tables.length; i++) {
                          catagoryData.AddExtraItemId(
                              tables[i]['id'].toString());
                        }
                      }
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
                    onPressed: () async {
                      final tables = await helper.allExtraData();
                      if(tables.isNotEmpty) {
                        for (int i = 0; i < tables.length; i++) {
                          catagoryData.AddExtraItemId(
                              tables[i]['id'].toString());
                        }
                      }
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
              SizedBox(height: 10,)
          ],
          ),
        ),
      ),
      floatingActionButton: _isLoading?Container():FloatingActionButton.extended(
        onPressed: ()async {
          setState(() {
            _isLoading=true;
          });
          final tables = await helper.allExtraData();
          //if(tables.takeWhile((value) => value['catename']==ItemData.selectedCategory).length==ItemData.subCategory.length) {
          for(int i=0;i<tables.length;i++) {
            if (tables[i]['branchid'] == catagoryData.id) {
              await Future.delayed(const Duration(seconds: 4));
              catagoryData.submitExtraForm(ExtraData(
                branchid: tables[i]['branchid'],
                date: tables[i]['date'],
                chain: tables[i]['chain'],
                branch: tables[i]['branch'],
                type: tables[i]['type'],
                capacity: tables[i]['capacity'],
                faces: tables[i]['faces'],
                situation: tables[i]['situation'],
                condition: tables[i]['condition'],
              ), (String response) async {
                print("Response:$response");
                print(tables[i]['id']);
              });
            }else{
              print('other branch');
            }
            setState(() {
              _isLoading = false;
            });
            Navigator.of(context).pop();
            /* }else{
            Scaffold.of(context).removeCurrentSnackBar();
            Scaffold.of(context).showSnackBar(SnackBar(
              duration: Duration(milliseconds : 1000),
              content: Text('Complete the Rest before Upload'),
            ));
            setState(() {
             // _isLoading=false;
            });
          }*/
          }
        },
        icon: Icon(Icons.save),
        label: Text("Save"),
      ),
    );
  }
}
