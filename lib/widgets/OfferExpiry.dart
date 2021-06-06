import 'package:flutter/material.dart';
import 'package:gard/models/db_Our_Offer_Data.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../dbhelper.dart';

class OfferExpiry extends StatefulWidget {

  OfferExpiry(
      {Key key,})
      : super(key: key);

  @override
  _ExtraCustomDialogBoxState createState() => _ExtraCustomDialogBoxState();
}

class _ExtraCustomDialogBoxState extends State<OfferExpiry> {

  String missingType;
  bool ISValidate=true;
  int _index = 0;
  int _precent=0;
  void isClicked(int index){
    setState(() {
      _index = index;
    });
  }
  void isClicked2(int index){
    setState(() {
      _precent = index;
    });
  }

  TextEditingController CountController = TextEditingController();

  DbHelper helper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper=DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context) {
    final ExtraData=Provider.of<Chains>(context);
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          padding: EdgeInsets.only(left: 20, top: 65, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: RaisedButton(
                        color: _index == 1 ? Colors.green: null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('قطعه'),
                        onPressed: () {
                          missingType='قطعه ';
                          isClicked(1);
                        }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: RaisedButton(
                        color: _index == 2 ? Colors.yellow: null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('علبه'),
                        onPressed: () {
                          missingType='علبه ';
                          isClicked(2);
                        }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: RaisedButton(
                        color: _index == 3 ? Colors.red: null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('كرتونه'),
                        onPressed: () {
                          missingType='كرتونه ';
                          isClicked(3);
                        }),
                  ),
                ],
              ),
              Column(
                children: [
                  Text('Count'),
                  Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: CountController,
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: '00',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
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
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.165,
                        child: RaisedButton(
                            color: _precent == 1 ? Colors.green: null,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text('30%'),
                            onPressed: () {
                              missingType='كرتونه ';
                              isClicked2(1);
                            }),
                      ),
                      SizedBox(width: 5,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.165,
                        child: RaisedButton(
                            color: _precent == 2 ? Colors.green: null,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text('50%'),
                            onPressed: () {
                              missingType='كرتونه ';
                              isClicked2(2);
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton.extended(
            onPressed: () async{
              if(_index == 0||_precent==0||CountController.text.isEmpty){
                setState(() {
                  ISValidate=false;
                });
              }else{
                // Navigator.of(context).popAndPushNamed(Items.RouteName);
                Navigator.of(context).pop();
                ISValidate=true;
              }
            },
            icon: Icon(Icons.save),
            label: Text("Save"),
          ),
        ),
        Positioned(
            left: 20,
            top: MediaQuery.of(context).size.height*0.15,
            child: Text(ISValidate?'':'Choose Operation Or Enter Values',style: TextStyle(color: Colors.red),)
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                child: Image.network('https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg')),
          ),
        ),
      ],
    );
  }
}