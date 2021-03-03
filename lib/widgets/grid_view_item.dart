import 'package:flutter/material.dart';
import 'package:gard/models/chainModel.dart';
import 'package:gard/Branches.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:provider/provider.dart';

class GridViewItem extends StatelessWidget {
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
        onTap: (){
            chainList = [
              Chain(
                id: id,
                chain: ChainName,
                imgUrl: imgUrl,
              )
            ];
            chainData.selectedPlace=ChainName;
            chainData.imgUrlSelectedPlace=imgUrl;
            chainData.onChangedCallback(ChainName);
            Navigator.of(context).pushNamed(Branches.RouteName);
    },
        child: GridTile(
          child: Image.network(imgUrl,fit: BoxFit.cover,),
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
