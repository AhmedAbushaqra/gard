import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gard/Items.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/models/ExpiryData.dart';
import 'package:gard/models/MissingData.dart';
import 'package:gard/models/db_Final_Data.dart';
import 'package:gard/models/final_data.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomDialogBox extends StatefulWidget {
  final String img;
  final int id;
  final bool isExist;
  final String oldcap;
  final String oldprice;
  final String oldfaces;

   CustomDialogBox(
      {Key key, this.img,this.id,this.isExist,this.oldcap,this.oldprice,this.oldfaces})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {

  String _selectedDate = 'Tap to select date';
  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker( //we wait for the dialog to return
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (d != null) //if the user has selected a date
      setState(() {
        // we format the selected date and assign it to the state variable
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }



  TextEditingController PriceController = TextEditingController();
  TextEditingController FacesController = TextEditingController();
  String capacity;
  String missingType;
  bool ISValidate=true;
  int _index = 0;
  void isClicked(int index){
    setState(() {
      _index = index;
    });
  }

  DbHelper helper;
  @override
  void initState() {
    super.initState();
    helper=DbHelper();
    if(widget.isExist){
      capacity=widget.oldcap;
      PriceController.text=widget.oldprice;
      FacesController.text=widget.oldfaces;
    }
    capacity=='Full Capacity'?_index=1:capacity=='Start Missing'?_index=2:capacity=='Missing'?_index=3:_index=0;
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
    final AllData=Provider.of<Chains>(context);
    String reportType=AllData.reportType;
    return reportType=='P.O.S'?Stack(
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
                  Text('Main Price'),
                  Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: PriceController,
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        style: TextStyle(fontSize: 22.0, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: '00.0 L.E',
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
                if(_index==0||PriceController.text.isEmpty||_index!=3 && FacesController.text.isEmpty){
                  setState(() {
                    ISValidate=false;
                  });
                }else{
                  int dbId = int.parse(AllData.id+AllData.itemId);
                   dbFinalData FD=dbFinalData(
                    id : dbId, branchid: AllData.id,date : DateFormat.yMMMMd("en_US").format(DateTime.now())
                    ,chain: AllData.selectedPlace, branch:AllData.selectedBranch,catename:AllData.selectedCategory,
                    subcatename:AllData.selectedSubCategory, itemname:AllData.ItemName,
                    capacity:capacity,faces:_index==3?'0':FacesController.text);
                   widget.isExist?helper.updateFinalData(FD):helper.createFinalData(FD);
                 /* AllData.submitForm(FinalData(
                    branchid: AllData.id,
                    date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                    chain: AllData.selectedPlace,
                    branch: AllData.selectedBranch,
                    catename: AllData.selectedCategory,
                    subcatename: AllData.selectedSubCategory,
                    itemname: AllData.ItemName,
                    capacity: capacity,
                    faces: _index==3?'0':FacesController.text,
                  ), (String response) {
                    print("Response:$response");
                  });*/
                 /* if(_index==3){
                    AllData.submitMissingForm(MissingData(
                      branchid: AllData.id,
                      date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
                      chain: AllData.selectedPlace,
                      branch: AllData.selectedBranch,
                      catename: AllData.selectedCategory,
                      subcatename: AllData.selectedSubCategory,
                      itemname: AllData.ItemName,
                      capacity: 'Missing',
                    ), (String response) {
                      print("Response:$response");
                    });
                  }*/
                  Navigator.of(context).pop();
                  Navigator.of(context).popAndPushNamed(Items.RouteName);
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
                child: Image.network(widget.img)),
          ),
        ),
      ],
    ):Stack(
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
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Count'),
                  Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    child: Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        controller: PriceController,
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
                  SizedBox(height: 30,),
                  Text('Expire Date'),
                 Column(
                   children: [

                     IconButton(
                         icon: Icon(Icons.calendar_today),
                         onPressed: (){
                           _selectDate(context);
                         }
                     ),
                     Text(_selectedDate+"")
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
            onPressed: () {
              if(_index==0||PriceController.text.isEmpty||_selectedDate=='Tap to select date'){
                setState(() {
                  ISValidate=false;
                });
              }else{
                AllData.submitExpiryForm(ExpiryData(
                  branchid: AllData.id,
                  chain: AllData.selectedPlace,
                  branch: AllData.selectedBranch,
                  itemnum: AllData.itemId,
                  catename: AllData.selectedCategory,
                  subcatename: AllData.selectedSubCategory,
                  itemname: AllData.ItemName,
                  count: PriceController.text,
                  itemtype: missingType,
                  expirydate: _selectedDate,
                ), (String response) {
                  print("Response:$response");
                });
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
                child: Image.network(widget.img)),
          ),
        ),
      ],
    );
  }
}