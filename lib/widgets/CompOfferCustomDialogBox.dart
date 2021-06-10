import 'package:flutter/material.dart';
import 'package:gard/models/db_Comp_offerData.dart';
import 'package:gard/models/db_Our_Offer_Data.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/OfferExpiry.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../dbhelper.dart';

class CompOfferCustomDialogBox extends StatefulWidget {
  final String id;
  final String branchid;
  final String company;
  final String branch;
  final String itemnum;
  final String catename;
  final String subcate;
  final String subBrand;
  final String ItemName;
  final bool isExist;
  final String oldReason;
  final String oldType;
  final String oldPrice;
  final String oldDetail;
  final String from;
  final String to;

  CompOfferCustomDialogBox(
      {Key key,this.id,this.branchid,this.company,this.branch,this.itemnum,this.catename,this.subcate,this.subBrand,
        this.ItemName,this.isExist,this.oldReason,this.oldType,this.oldPrice,this.oldDetail,this.from,this.to})
      : super(key: key);

  @override
  _ExtraCustomDialogBoxState createState() => _ExtraCustomDialogBoxState();
}

class _ExtraCustomDialogBoxState extends State<CompOfferCustomDialogBox> {

  TextEditingController PriceController = TextEditingController();
  TextEditingController DetailController = TextEditingController();
  TextEditingController ItemController = TextEditingController();
  String capacity;
  bool ISValidate=true;
  String reason;
  String type;

  String _selectedfromDate = 'Tap to select date';
  String _selectedtoDate = 'Tap to select date';
  Future<void> _selectfromDate(BuildContext context) async {
    final DateTime d = await showDatePicker( //we wait for the dialog to return
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (d != null) //if the user has selected a date
      setState(() {
        // we format the selected date and assign it to the state variable
        _selectedfromDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }
  Future<void> _selecttoDate(BuildContext context) async {
    final DateTime d = await showDatePicker( //we wait for the dialog to return
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (d != null) //if the user has selected a date
      setState(() {
        // we format the selected date and assign it to the state variable
        _selectedtoDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }
  DbHelper helper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper=DbHelper();
   /* if(widget.isExist){
      reason=widget.oldReason;
      type=widget.oldType;
      PriceController.text=widget.oldPrice;
      DetailController.text=widget.oldDetail;
      _selectedfromDate=widget.from;
      _selectedtoDate=widget.to;
    }*/
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
          height: MediaQuery.of(context).size.height * 0.68,
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
          child: ListView(
            children: [
              Text('Competitor Item Name'),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Theme(
                  data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                  child: TextField(
                    controller: ItemController,
                    autofocus: false,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Competitor Item Name',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      DropdownButton<String>(
                        value: reason,
                        hint: Text('selectItem'),
                        items: <String>['عرض شهري', 'عرض صلاحية', 'عرض مجلة'].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            reason=value;
                          });
                        },
                      ),
                      DropdownButton<String>(
                        hint: Text('select Item'),
                        value: type,
                        items: <String>['عرض سعر', 'كميه زياده', 'هديه', 'عروض خاصة'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            type=value;
                          });
                        },
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                  Column(
                    children: [
                      Text('MainPrice'),
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
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.1,
                child: Theme(
                  data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                  child: TextField(
                    maxLines: 3,
                    controller: DetailController,
                    autofocus: false,
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'promotion Details',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('From'),
                      IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: (){
                            _selectfromDate(context);
                          }
                      ),
                      Text(_selectedfromDate+""),
                    ],
                  ),
                  Column(
                    children: [
                      Text('To'),
                      IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: (){
                            _selecttoDate(context);
                          }
                      ),
                      Text(_selectedtoDate+""),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 50,)
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton.extended(
            onPressed: () async{
              if(reason==null||type==null || PriceController.text.isEmpty||DetailController.text.isEmpty||
                  ItemController.text.isEmpty||_selectedfromDate =='Tap to select date'||_selectedtoDate=='Tap to select date'){
                setState(() {
                  ISValidate=false;
                });
              }else{
                dbCompOfferData OOD=dbCompOfferData(
                  id: int.parse(widget.id),
                  branchid: widget.branchid,
                  catename: widget.catename,
                  company: widget.company,
                  itemname: ItemController.text,
                  MainPrice: PriceController.text,
                  PormotionReason: reason,
                  pormotiontype: type,
                  PormotionDetails: DetailController.text,
                  enddate: _selectedfromDate,
                  startdate: _selectedtoDate,
                );
                //widget.isExist?await helper.updateOurOfferData(OOD):
                await helper.createComOfferData(OOD);
                ExtraData.AddCompOfferItemId(widget.id);
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