import 'package:flutter/material.dart';
import 'package:gard/dbhelper.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/CustomDialogBox.dart';
import 'package:provider/provider.dart';

class ItemsListView extends StatefulWidget {
  final String id;
  final String ItemName;
  final String itemImgUrl;
  final String SubCate;

  ItemsListView(this.id, this.ItemName, this.itemImgUrl, this.SubCate,);

  @override
  _ItemsListViewState createState() => _ItemsListViewState();
}

class _ItemsListViewState extends State<ItemsListView> {
  bool isClick = false;
  bool isExist=false;
  String oldcap;
  String oldprice;
  String oldfaces;
  DbHelper helper;
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
        future: helper.allFinalData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(),);
          } else {
            for (int i = 0; i < snapshot.data.length; i++) {
              String dbid = snapshot.data[i]['id'].toString();
              if (dbid == id.toString()) {
                isClick = true;
                isExist = true;
                oldcap = snapshot.data[i]['capacity'];
                oldprice='0';
                oldfaces=snapshot.data[i]['faces'];
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
                          );
                        });
                  },
                  title: Text(widget.ItemName),
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