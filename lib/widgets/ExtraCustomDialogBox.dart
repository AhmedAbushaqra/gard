import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:gard/models/db_Extra_Data.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../dbhelper.dart';

class ExtraCustomDialogBox extends StatefulWidget {
  final String id;
  final String type;

    ExtraCustomDialogBox(
      {Key key,this.id,this.type})
      : super(key: key);

  @override
  _ExtraCustomDialogBoxState createState() => _ExtraCustomDialogBoxState();
}

class _ExtraCustomDialogBoxState extends State<ExtraCustomDialogBox> {

  TextEditingController FacesController = TextEditingController();
  String capacity;
  bool ISValidate=true;
  int _index = 0;
  String situation;
  String condition;
  void isClicked(int index){
    setState(() {
      _index = index;
    });
  }

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
          height: MediaQuery.of(context).size.height * 0.55,
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
                        child: Text('Full Capacity'),
                        onPressed: () {
                          isClicked(1);
                          capacity='Full Capacity';
                        }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: RaisedButton(
                        color: _index == 2 ? Colors.yellow: null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Start Missing'),
                        onPressed: () {
                          isClicked(2);
                          capacity='Start Missing';
                        }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: RaisedButton(
                        color: _index == 3 ? Colors.red: null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Missing'),
                        onPressed: () {
                          isClicked(3);
                          capacity='Missing';
                        }),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DropdownButton<String>(
                    value: situation,
                    hint: Text('selectItem'),
                    items: <String>['دائم', 'مؤقت', 'ملك الفرع', 'غير موجود'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        situation=value;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    hint: Text('select Item'),
                    value: condition,
                    items: <String>['جيدة', 'سيئة', 'مرفوعة بالمخزن', 'غير موجود'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        condition=value;
                      });
                    },
                  ),
                  SizedBox(height: 30,),
                  _index == 3 ?Container()
                      :Text('Faces'),
                  _index==3?Container()
                      :Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: FacesController,
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
              if(_index==0||situation==null||condition==null || _index!=3 && FacesController.text.isEmpty){
                setState(() {
                  ISValidate=false;
                });
              }else{
                int dbEId= int.parse(ExtraData.id+widget.id);
                dbExtraData ED=dbExtraData(
                  id: dbEId,
                  branchid: ExtraData.id,
                  date: DateFormat.yMd().format(DateTime.now()),
                  chain: ExtraData.selectedPlace,
                  branch: ExtraData.selectedBranch,
                  type: widget.type,
                  capacity: capacity,
                  faces: _index==3?'0':FacesController.text,
                  situation: situation,
                  condition: condition,
                );
                int id = await helper.createExtraData(ED);
                print(id);
                Navigator.of(context).pop();
               // Navigator.of(context).popAndPushNamed(Items.RouteName);
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
