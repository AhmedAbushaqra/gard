import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gard/Charts/Bon.MissChart.dart';
import 'package:gard/Charts/CategoryMissChart.dart';
import 'package:gard/Charts/TopDroppedItems.dart';
import 'package:gard/models/MissingData.dart';
import 'package:gard/provider/ChainProvider.dart';

class SelectCategoryChart extends StatefulWidget {
  static const RouteName = "/SelectedCategoryChart";
  @override
  _SelectCategoryChartState createState() => _SelectCategoryChartState();
}

class _SelectCategoryChartState extends State<SelectCategoryChart> {
  List<MissingData> missingDataItems = List<MissingData>();
  double bonmiss=0;
  double nescmiss=0;
  double coffmatemiss=0;
  double nidomiss=0;
  double babymiss=0;
  double nesqmiss=0;
  double maggimiss=0;
  double cerealmiss=0;
  double confecmiss=0;
  double watermiss=0;
  void initState() {
    Chains().getMissingData().then((missingDataItems) {
      setState(() {
        this.missingDataItems = missingDataItems;
        getData();
        countItem();
      });
    });
    super.initState();
  }
  void getData() {
    for (var item in missingDataItems) {
      String category = item.catename;
      if (category == "BONJORNO") {
        setState(() {
          bonmiss = bonmiss + 1;
        });
      } else if (category == "NESCAFE") {
        setState(() {
          nescmiss = nescmiss + 1;
        });
      } else if (category == "COFFEE-MATE") {
        setState(() {
          coffmatemiss = coffmatemiss + 1;
        });
      } else if (category == "NIDO") {
        setState(() {
          nidomiss = nidomiss + 1;
        });
      } else if (category == "BABY FOOD") {
        setState(() {
          babymiss = babymiss + 1;
        });
      } else if (category == "NESQUIK") {
        setState(() {
          nesqmiss = nesqmiss + 1;
        });
      } else if (category == "MAGGI") {
        setState(() {
          maggimiss = maggimiss + 1;
        });
      } else if (category == "CEREAL") {
        setState(() {
          cerealmiss = cerealmiss + 1;
        });
      } else if (category == "CONFECTIONERY") {
        setState(() {
          confecmiss = confecmiss + 1;
        });
      } else if (category == "WATER") {
        setState(() {
          watermiss = watermiss + 1;
        });
      }
    }
  }
  int threeInOneICE=0;
  int Fish=0;
  int kidspotato=0;
  var topThreeMis=[];
  void countItem(){
    for(var items in missingDataItems){
      String item = items.itemname;
      if (item=="3in1 ICE"){
        threeInOneICE=threeInOneICE+1;
      }else if(item=="Fish"){
        Fish=Fish+1;
      }else if(item=="Kids potato")
        kidspotato=kidspotato+1;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                width: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                margin: EdgeInsets.all(10),
                //width: MediaQuery.of(context).size.width*0.6,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightBlue)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                        CategoryMissChart(cateAnalysis: "BONJORNO",)
                        ));
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Color.fromRGBO(0, 160, 227, 1),
                      textColor: Colors.white,
                      child: Text("BONJORNO",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "${(bonmiss/missingDataItems.length*100).toStringAsFixed(2)}%",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3.0
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //*****************************************************************************************
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                width: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                margin: EdgeInsets.all(10),
                //width: MediaQuery.of(context).size.width*0.6,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightBlue)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            CategoryMissChart(cateAnalysis: "NESCAFE",)
                        ));
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Color.fromRGBO(0, 160, 227, 1),
                      textColor: Colors.white,
                      child: Text("NESCAFE",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      // margin: const EdgeInsets.all(30.0),
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "${(nescmiss/missingDataItems.length*100).toStringAsFixed(2)}%",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3.0
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //****************************************************************************************
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                width: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                margin: EdgeInsets.all(10),
                //width: MediaQuery.of(context).size.width*0.6,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightBlue)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            CategoryMissChart(cateAnalysis: "COFFEE-MATE",)
                        ));
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Color.fromRGBO(0, 160, 227, 1),
                      textColor: Colors.white,
                      child: Text("COFFEE-MATE",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      // margin: const EdgeInsets.all(30.0),
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "${(coffmatemiss/missingDataItems.length*100).toStringAsFixed(2)}%",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3.0
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //*************************************************************************************************
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                width: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                margin: EdgeInsets.all(10),
                //width: MediaQuery.of(context).size.width*0.6,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightBlue)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            CategoryMissChart(cateAnalysis: "NIDO",)
                        ));
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Color.fromRGBO(0, 160, 227, 1),
                      textColor: Colors.white,
                      child: Text("NIDO",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      // margin: const EdgeInsets.all(30.0),
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "${(nidomiss/missingDataItems.length*100).toStringAsFixed(2)}%",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3.0
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //*********************************************************************************************************
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                width: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                margin: EdgeInsets.all(10),
                //width: MediaQuery.of(context).size.width*0.6,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightBlue)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            CategoryMissChart(cateAnalysis: "BABY FOOD",)
                       ));
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Color.fromRGBO(0, 160, 227, 1),
                      textColor: Colors.white,
                      child: Text("BABY FOOD",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      // margin: const EdgeInsets.all(30.0),
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "${(babymiss/missingDataItems.length*100).toStringAsFixed(2)}%",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3.0
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //**********************************************************************************************
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                width: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                margin: EdgeInsets.all(10),
                //width: MediaQuery.of(context).size.width*0.6,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightBlue)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            CategoryMissChart(cateAnalysis: "NESQUIK",)
                        ));
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Color.fromRGBO(0, 160, 227, 1),
                      textColor: Colors.white,
                      child: Text("NESQUIK",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      // margin: const EdgeInsets.all(30.0),
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "${(nesqmiss/missingDataItems.length*100).toStringAsFixed(2)}%",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3.0
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //*************************************************************************************************
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                width: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                margin: EdgeInsets.all(10),
                //width: MediaQuery.of(context).size.width*0.6,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightBlue)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            CategoryMissChart(cateAnalysis: "MAGGI",)
                        ));
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Color.fromRGBO(0, 160, 227, 1),
                      textColor: Colors.white,
                      child: Text("MAGGI",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      // margin: const EdgeInsets.all(30.0),
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "${(maggimiss/missingDataItems.length*100).toStringAsFixed(2)}%",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3.0
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //*****************************************************************************************
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                width: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                margin: EdgeInsets.all(10),
                //width: MediaQuery.of(context).size.width*0.6,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightBlue)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            CategoryMissChart(cateAnalysis: "CEREAL",)
                        ));
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Color.fromRGBO(0, 160, 227, 1),
                      textColor: Colors.white,
                      child: Text("CEREAL",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      // margin: const EdgeInsets.all(30.0),
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "${(cerealmiss/missingDataItems.length*100).toStringAsFixed(2)}%",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3.0
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //********************************************************************************************************
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                width: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                margin: EdgeInsets.all(10),
                //width: MediaQuery.of(context).size.width*0.6,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightBlue)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            CategoryMissChart(cateAnalysis: "CONFECTIONERY",)
                        ));
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Color.fromRGBO(0, 160, 227, 1),
                      textColor: Colors.white,
                      child: Text("CONFECTIONERY",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      // margin: const EdgeInsets.all(30.0),
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "${(confecmiss/missingDataItems.length*100).toStringAsFixed(2)}%",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3.0
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //*********************************************************************************************************
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                width: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [new Color(0xff64B6FF),Colors.black12,],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                margin: EdgeInsets.all(10),
                //width: MediaQuery.of(context).size.width*0.6,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.lightBlue)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            CategoryMissChart(cateAnalysis: "WATER",)
                        ));
                      },
                      padding: EdgeInsets.all(10.0),
                      color: Color.fromRGBO(0, 160, 227, 1),
                      textColor: Colors.white,
                      child: Text("WATER",
                          style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      // margin: const EdgeInsets.all(30.0),
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "${(watermiss/missingDataItems.length*100).toStringAsFixed(2)}%",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3.0
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
                    //***************************************************************************************
              Container(
                margin: EdgeInsets.all(10),
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                  onPressed: () {
                    if(Fish==0){
                      SnackBar(content: Text('Waiting Data'));
                    }else {
                      topThreeMis.insert(0, {'name':'Fish','count':Fish,'precentage':missingDataItems.length,'pic':'images/MAGGI.jpg'});
                      topThreeMis.insert(1, {'name':'3in1 ICE','count':threeInOneICE,'precentage':missingDataItems.length,'pic':"images/NESCAFE.jpg"});
                      topThreeMis.insert(2, {'name':'Kids potato','count':kidspotato,'precentage':missingDataItems.length,'pic':'images/MAGGI.jpg'});
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                          TopDroppedItems(topThreeMis: topThreeMis,)
                      ));
                      print(topThreeMis[0]['precentage']);
                    }
                  },
                  padding: EdgeInsets.all(10.0),
                  color: Color.fromRGBO(0, 160, 227, 1),
                  textColor: Colors.white,
                  child: Text("Top Dropped Items",
                      style: TextStyle(fontSize: 15)),
                ),
              ),
                //*************************************************************************************************
                    SizedBox(height: 10,)
                  ],
                ),
              ),
      ),
    );
  }
}
