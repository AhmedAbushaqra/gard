import 'package:flutter/material.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:provider/provider.dart';

import '../dbhelper.dart';
import 'ExtraCustomDialogBox.dart';

class ExtraListView extends StatefulWidget {
  final String id;
  final String extraName;

  ExtraListView(this.id,this.extraName);
  @override
  _ExtraListViewState createState() => _ExtraListViewState();
}

class _ExtraListViewState extends State<ExtraListView> {
  bool isClick = false;
  DbHelper helper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper=DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<Chains>(context);
    return FutureBuilder(
        future: helper.allExtraCate(),
        builder: (context, AsyncSnapshot snapshotCate){
          if (!snapshotCate.hasData) {
            return Center(child: CircularProgressIndicator(),);
          } else {
            for (int i = 0; i < snapshotCate.data.length; i++) {
              String dbid = itemData.id + snapshotCate.data[i]['id'].toString();
              for(String id in itemData.extraItemId){
               print(itemData.extraItemId.length);
              if (id==dbid) {
                print(id);
                isClick = true;
              }
              }
            }
            return Column(
              children: [
                Divider(),
                ListTile(
                  onTap: () async {
                    //String dbid = itemData.id + snapshotCate.data[index]['id'].toString();
                    print(itemData.id+widget.id);
                    print(itemData.extraItemId);
                    /* final tables = await helper.allExtraData();
                                    //print(itemData.id + snapshot.data[index]['id'].toString());
                                    //print(tables);
                                    //Future.delayed(Duration(seconds: 5));
                                     for (int i=0; i < tables.length; i++) {
                                       String dbid = itemData.id + snapshot.data[index]['id'].toString();
                                       if (tables[i]['id']==int.parse(dbid)) {
                                         print(dbid);
                                         print('true');
                                         isClick = true;
                                       } else {
                                         print(dbid);
                                         print(tables[i]['id']);
                                         print('false');
                                       }
                                     }*/
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ExtraCustomDialogBox(
                            id: widget.id,
                            type: widget.extraName,
                          );
                        });
                  },
                  title: Text(widget.extraName),
                  trailing: Checkbox(
                    value: isClick,
                    onChanged: (value) {
                      setState(() {
                        value = isClick;
                      });
                    },
                  ),
                ),
              ],
            );
          }
        }
    );
  }
}
