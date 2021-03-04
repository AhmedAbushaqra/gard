import 'package:flutter/material.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/CustomDialogBox.dart';
import 'package:provider/provider.dart';

class ItemsListView extends StatefulWidget {
  final String id;
  final String ItemName;
  final String itemImgUrl;
  final String SubCate;

  ItemsListView(this.id,this.ItemName,this.itemImgUrl,this.SubCate);

  @override
  _ItemsListViewState createState() => _ItemsListViewState();
}

class _ItemsListViewState extends State<ItemsListView> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    final itemData=Provider.of<Chains>(context);
    return Column(
      children: [
        Divider(),
        ListTile(
          onTap: (){
            itemData.itemId=widget.id;
            itemData.selectedSubCategory=widget.SubCate;
            itemData.ItemName=widget.ItemName;
            showDialog(context: context,
                      builder: (BuildContext context){
                        return CustomDialogBox(
                          img: widget.itemImgUrl,
                        );
                      }
                  );
            setState(() {
              this.isClick = !isClick;
            });
          },
          title: Text(widget.ItemName),
          leading: CircleAvatar(backgroundImage: NetworkImage(widget.itemImgUrl),maxRadius: 55,),
          trailing: Checkbox(
            value: isClick,
            onChanged: (isClick){
            },
          ),
        ),
      ],
    );
  }
}
