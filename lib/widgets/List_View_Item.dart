import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gard/Category.dart';
import 'package:gard/Reports.dart';
import 'package:gard/models/chainModel.dart';
import 'package:gard/models/empLogin.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListViewItem extends StatefulWidget {
  final String id;
  final String BranchName;
  final String imgUrl;

  ListViewItem(this.id,this.BranchName,this.imgUrl);

  @override
  _ListViewItemState createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  bool _isLoading=false;

  @override
  Widget build(BuildContext context) {
    final chainData=Provider.of<Chains>(context);
    return _isLoading?Center(child: CircularProgressIndicator(),):Column(
      children: [
        Divider(),
        ListTile(
          title: Text(widget.BranchName),
          onTap: ()async{
            setState(() {
              _isLoading=true;
            });
            try {
              final result = await InternetAddress.lookup('example.com');
              if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                print('connected');
                chainData.submitLogIn(empLogIn(
                  code: chainData.empcode,
                  date: DateFormat.yMd().format(DateTime.now()),
                  name: chainData.empname,
                  chain: chainData.selectedPlace,
                  branchid: widget.id,
                  branch: widget.BranchName,
                  logintime: DateFormat.Hms().format(DateTime.now()),
                ), (String response) async {
                  await print("Response:$response");
                  if (response=='SUCCESS') {
                    setState(() {
                      _isLoading = false;
                    });
                    chainData.id = widget.id;
                    chainData.selectedBranch = widget.BranchName;
                    Navigator.of(context).pushNamed(Reports.RouteName);
                  }
                });
              }
            } on SocketException catch (_) {
              print('not connected');
              setState(() {
                _isLoading = false;
              });
              await showDialog(
                  context: context,
                  builder: (ctx) =>
                      AlertDialog(
                        title: Text('An Error Occurred'),
                        content: Text(
                            'Check internet Connection'),
                        actions: [
                          FlatButton(onPressed: () {
                            Navigator.of(ctx).pop();
                          }, child: Text('OK'))
                        ],
                      )
              );
            }
          },
          leading: CircleAvatar(backgroundImage: AssetImage(widget.imgUrl),maxRadius: 55,),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios,),
            onPressed: (){
              chainData.submitLogIn(empLogIn(
              code: chainData.empcode,
              date: DateFormat.yMd().format(DateTime.now()),
              name: chainData.empname,
              chain: chainData.selectedPlace,
              branchid: widget.id,
              branch: widget.BranchName,
              logintime: DateFormat.Hms().format(DateTime.now()),
              ), (String response) async {
                await print("Response:$response");
              });
              chainData.id=widget.id;
              chainData.selectedBranch=widget.BranchName;
              Navigator.of(context).pushNamed(Reports.RouteName);
            },
          ),
        ),
      ],
    );
  }
}
