import 'package:flutter/material.dart';
import 'package:gard/dbhelper.dart';

class OurMainPScreen extends StatefulWidget {
  @override
  _OurMainPScreenState createState() => _OurMainPScreenState();
}

class _OurMainPScreenState extends State<OurMainPScreen> {
  DbHelper helper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helper=DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ,
    );
  }
}
