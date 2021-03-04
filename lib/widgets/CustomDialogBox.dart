import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gard/models/final_data.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:provider/provider.dart';

class CustomDialogBox extends StatefulWidget {
  final String img;

   CustomDialogBox(
      {Key key, this.img})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  TextEditingController PriceController = TextEditingController();
  TextEditingController FacesController = TextEditingController();
  bool ISValidate=true;
  int _index = 0;
  void isClicked(int index){
    setState(() {
      _index = index;
    });
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
                          hintText: '00.0',
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
              onPressed: () {
                if(_index==0||PriceController.text.isEmpty||_index!=3 && FacesController.text.isEmpty){
                  setState(() {
                    ISValidate=false;
                  });
                }else{
                  AllData.submitForm(FinalData(
                    branchid: AllData.id,
                    date: '4/3/2021',
                    chain: AllData.selectedPlace,
                    branch: AllData.selectedBranch,
                    catename: AllData.selectedCategory,
                    subcatename: AllData.selectedSubCategory,
                    itemid: AllData.itemId,
                    itemname: AllData.ItemName,
                    price: PriceController.text,
                    faces: _index==3?'none':FacesController.text,
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
