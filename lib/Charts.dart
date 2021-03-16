import 'package:flutter/material.dart';
import 'package:gard/models/ExpiryData.dart';
import 'package:provider/provider.dart';

import 'provider/ChainProvider.dart';

class Charts extends StatefulWidget {
  static const RouteName = "/Charts";
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  List<ExpiryData> expiryDataItems = List<ExpiryData>();

  @override
  void initState() {
    Chains().getExpiryData().then((expiryDataItems) {
      setState(() {
        this.expiryDataItems = expiryDataItems;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: expiryDataItems.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text("${expiryDataItems[index].branchid} ${expiryDataItems[index].chain}"),
          );
        },
      ),
    );
  }
}
