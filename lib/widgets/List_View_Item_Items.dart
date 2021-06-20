import 'package:flutter/material.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/CustomDialogBox.dart';
import 'package:provider/provider.dart';

class ItemsListView extends StatefulWidget {
  final String id;
  final String ItemName;
  final String transName;
  final String MainPCateName;
  final String itemImgUrl;
  final String SubCate;

  ItemsListView(this.id, this.ItemName,this.transName,this.MainPCateName ,this.itemImgUrl, this.SubCate,);

  @override
  _ItemsListViewState createState() => _ItemsListViewState();
}

class _ItemsListViewState extends State<ItemsListView> {
  bool isClick = false;
  bool isExist=false;
  bool isMainPExist=false;
  String oldcap;
  String oldprice;
  String oldfaces;
  String oldSize;
  DbHelper helper;
  String report='P.O.S';
//webSite For sqlite With provider // https://noxasch.tech/blog/flutter-using-sqflite-with-provider/[
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<Chains>(context);
    int id = int.parse(itemData.id + widget.id);
    return FutureBuilder(
        future: Future.wait([helper.allFinalData(),helper.allOurMainPrice()]),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(),);
          } else {
            for (int i = 0; i < snapshot.data[0].length; i++) {
              String dbid = snapshot.data[0][i]['id'].toString();
              if (dbid == id.toString()) {
                isClick = true;
                isExist = true;
                oldcap = snapshot.data[0][i]['capacity'];
                oldfaces=snapshot.data[0][i]['faces'];
              }
            }
            for(int i=0;i<snapshot.data[1].length;i++){
              String dbid = snapshot.data[1][i]['id'].toString();
              if(dbid==id.toString()){
                isMainPExist=true;
                oldprice=snapshot.data[1][i]['price'];
                oldSize=snapshot.data[1][i]['size'];
              }
            }
            return Column(
              children: [
                Divider(),
                ListTile(
                  onTap: () {
                    itemData.itemId = widget.id;
                    itemData.selectedSubCategory = widget.SubCate;
                    itemData.ItemName = widget.ItemName;
                    itemData.MainPCateName=widget.MainPCateName;
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialogBox(
                            img: widget.itemImgUrl,
                            id: id,
                            isExist: isExist,
                            oldcap: oldcap,
                            oldprice: oldprice,
                            oldfaces: oldfaces,
                            report:report,
                            isMainPExist: isMainPExist,
                            oldSize: oldSize,
                          );
                        });
                  },
                  title: Text(widget.transName),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(widget.itemImgUrl),
                    maxRadius: 55,
                  ),
                  trailing: Consumer<Chains>(builder: (_, provider, __) {
                    return Checkbox(
                      value: isClick,
                      onChanged: (value) {
                        setState(() {
                          value = isClick;
                        });
                      },
                    );
                  }),
                ),
              ],
            );
          }
        }
        );
  }
}