import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gard/main.dart';
import 'package:gard/models/empLogin.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/translation/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  static const RouteName = "/LogIn_screen";

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String NE = 'NE';
  TextEditingController empCode = TextEditingController();
  String name = '';
  bool isArabic = false;
  bool isAlex = true;
  bool isLocationSet=false;

  String _locationMessage = "";

  void _getCurrentLocation() async {
    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
      isLocationSet=true;
    });
    print(_locationMessage);
  }

  @override
  Widget build(BuildContext context) {
    final empData = Provider.of<Chains>(context);
    void codeIsEntered(String code) {
      for (int i = 0; i < empData.empCodes.length; i++) {
        if (empData.empCodes[i]['code'] == NE + code) {
          setState(() {
            name = empData.empCodes[i]['name'];
          });
          return;
        } else {
          setState(() {
            name = '';
          });
        }
      }
    }
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.6,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(name, style: TextStyle(fontSize: 22.0,
                    color: name == 'Enter Right Code' ? Colors.red : Colors
                        .black),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10,left: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Text(NE,
                      style: TextStyle(fontSize: 22.0, color: Colors.black),),
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.3,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          splashColor: Colors.transparent),
                      child: TextField(
                        onChanged: (value) {
                          codeIsEntered(value);
                        },
                        controller: empCode,
                        maxLength: 5,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: '30***',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              right: 5,left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(isLocationSet?'Location Selected':''),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                  onPressed: () {_getCurrentLocation();},
                  padding: EdgeInsets.all(10.0),
                  color: Color.fromRGBO(0, 160, 227, 1),
                  textColor: Colors.white,
                  child: Text(LocaleKeys.location.tr(),
                      style: TextStyle(fontSize: 15)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        color: isArabic == false ? Color.fromRGBO(
                            0, 160, 227, 1) : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Color.fromRGBO(0, 160, 227,
                                1))),
                        child: Text('English'),
                        onPressed: () {
                          setState(() {
                            isArabic = false;
                            context.locale=Locale('en');
                          });
                        }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        color: isArabic == true
                            ? Color.fromRGBO(0, 160, 227, 1)
                            : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Color.fromRGBO(0, 160, 227,
                                1))),
                        child: Text('عربى'),
                        onPressed: () {
                          setState(() {
                            isArabic = true;
                            context.locale=Locale('ar');
                          });
                        }
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        color: isAlex == true
                            ? Color.fromRGBO(0, 160, 227, 1)
                            : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Color.fromRGBO(0, 160, 227,
                                1))),
                        child: Text(LocaleKeys.AlexAndDelta.tr()),
                        onPressed: () {
                          setState(() {
                            isAlex = true;
                          });
                        }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        color: isAlex == false
                            ? Color.fromRGBO(0, 160, 227, 1)
                            : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Color.fromRGBO(0, 160, 227,
                                1))),
                        child: Text(LocaleKeys.Cairo.tr()),
                        onPressed: () {
                          setState(() {
                            isAlex = false;
                          });
                        }
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                  onPressed: () async {
                    if (name == '' || name == 'Enter Right Code') {
                      setState(() {
                        name = 'Enter Right Code';
                      });
                    } else {
                      empData.empcode=NE+empCode.text;
                      empData.empname=name;
                      empData.empLocation;
                      Navigator.of(context).pushNamed(Home.RouteName);
                    }
                  },
                  padding: EdgeInsets.all(10.0),
                  color: Color.fromRGBO(0, 160, 227, 1),
                  textColor: Colors.white,
                  child: Text(LocaleKeys.LogIn.tr(),
                      style: TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
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
 */