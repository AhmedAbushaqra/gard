import 'package:flutter/material.dart';
import 'package:gard/models/chainModel.dart';
import 'package:gard/Branches.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../dbhelper.dart';

class GridViewItem extends StatefulWidget {
  final String id;
  final String ChainName;
  final String TransName;
  final String imgUrl;

  GridViewItem(this.id,this.ChainName,this.TransName,this.imgUrl);

  @override
  _GridViewItemState createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  DbHelper helper=DbHelper();

  List<Chain> chainList = [];

  @override
  Widget build(BuildContext context) {
    final chainData=Provider.of<Chains>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child:GestureDetector(
        onTap: ()async{
          setState(() {
            widget.TransName;
          });
          print(widget.TransName);
          final tables = await helper.allFinalData();
          helper.clearcatesheetPreviousDay();
          helper.clearcatePreviousDay();
          //helper.clearAllOfferDataPreviousDay();
          //helper.clearComOfferCatePreviousDay();
          //helper.clearComOfferDataPreviousDay();
          //helper.clearOurOfferCatePreviousDay();
          //helper.clearOurOfferDataPreviousDay();
          //helper.clearPreviousDay();
          //helper.clearExtraPreviousDay();
         // helper.clearExtraCatePreviousDay();
          if(tables.isEmpty){
            chainList = [
              Chain(
                id: widget.id,
                chain: widget.ChainName,
                imgUrl: widget.imgUrl,
              )
            ];
            chainData.selectedPlace = widget.ChainName;
            chainData.imgUrlSelectedPlace = widget.imgUrl;
            chainData.onChangedCallback(widget.ChainName);
            Navigator.of(context).pushNamed(Branches.RouteName);
          }else if(tables[0]['date'].toString()!=DateFormat.yMMMMd("en_US").format(DateTime.now()).toString()) {
           // helper.clearPreviousDay();
            helper.clearExtraPreviousDay();
            chainList = [
              Chain(
                id: widget.id,
                chain: widget.ChainName,
                imgUrl: widget.imgUrl,
              )
            ];
            chainData.selectedPlace = widget.ChainName;
            chainData.imgUrlSelectedPlace = widget.imgUrl;
            chainData.onChangedCallback(widget.ChainName);
            Navigator.of(context).pushNamed(Branches.RouteName);
          }else{
            chainList = [
              Chain(
                id: widget.id,
                chain: widget.ChainName,
                imgUrl: widget.imgUrl,
              )
            ];
            chainData.selectedPlace = widget.ChainName;
            chainData.imgUrlSelectedPlace = widget.imgUrl;
            chainData.onChangedCallback(widget.ChainName);
            Navigator.of(context).pushNamed(Branches.RouteName);
          }
    },
        child: GridTile(
          child: Image.asset(widget.imgUrl,fit: BoxFit.fill,),
          // header: ,
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              widget.TransName,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
