import 'package:flutter/material.dart';
import 'package:gard/models/chainModel.dart';
import 'package:gard/Branches.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../dbhelper.dart';

class GridViewItem extends StatelessWidget {
  DbHelper helper=DbHelper();

  final String id;
  final String ChainName;
  final String imgUrl;

  GridViewItem(this.id,this.ChainName,this.imgUrl);
  List<Chain> chainList = [];
  @override
  Widget build(BuildContext context) {
    final chainData=Provider.of<Chains>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child:GestureDetector(
        onTap: ()async{
          final tables = await helper.allFinalData();
          //helper.clearPreviousDay();
          //helper.clearExtraPreviousDay();
         // helper.clearExtraCatePreviousDay();
          if(tables.isEmpty){
            chainList = [
              Chain(
                id: id,
                chain: ChainName,
                imgUrl: imgUrl,
              )
            ];
            chainData.selectedPlace = ChainName;
            chainData.imgUrlSelectedPlace = imgUrl;
            chainData.onChangedCallback(ChainName);
            Navigator.of(context).pushNamed(Branches.RouteName);
          }else if(tables[0]['date'].toString()!=DateFormat.yMMMMd("en_US").format(DateTime.now()).toString()) {
            helper.clearPreviousDay();
            helper.clearExtraPreviousDay();
            chainList = [
              Chain(
                id: id,
                chain: ChainName,
                imgUrl: imgUrl,
              )
            ];
            chainData.selectedPlace = ChainName;
            chainData.imgUrlSelectedPlace = imgUrl;
            chainData.onChangedCallback(ChainName);
            Navigator.of(context).pushNamed(Branches.RouteName);
          }else{
            chainList = [
              Chain(
                id: id,
                chain: ChainName,
                imgUrl: imgUrl,
              )
            ];
            chainData.selectedPlace = ChainName;
            chainData.imgUrlSelectedPlace = imgUrl;
            chainData.onChangedCallback(ChainName);
            Navigator.of(context).pushNamed(Branches.RouteName);
          }
    },
        child: GridTile(
          child: Image.asset(imgUrl,fit: BoxFit.fill,),
          // header: ,
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              ChainName,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
