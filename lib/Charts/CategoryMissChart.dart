import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gard/Branches.dart';
import 'package:gard/models/MissingData.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/indicator.dart';

import 'ChainMissChart.dart';

class CategoryMissChart extends StatefulWidget {
  static const RouteName = "/CategoryMissChart";

  @override
  _CategoryMissChartState createState() => _CategoryMissChartState();
}

class _CategoryMissChartState extends State<CategoryMissChart> {
  List<MissingData> missingDataItems = List<MissingData>();

  void initState() {
    Chains().getMissingData().then((missingDataItems) {
      setState(() {
        this.missingDataItems = missingDataItems;
      });
    });
    super.initState();
  }

  int touchedIndex;
  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [new Color(0xff374ABE), new Color(0xff64B6FF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.analytics_outlined),
                        Container(
                          //constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                          //alignment: Alignment.center,
                          child: Text(
                            "Item side of view",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.5,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    color: Colors.white,
                    child: Padding(
                      padding:  EdgeInsets.only(top: 16.0,bottom: 35),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.center,
                          barTouchData: BarTouchData(
                            touchCallback: (BarTouchResponse barTouchResponse){
                              setState(() {
                                if(barTouchResponse.touchInput is FlPanStart && barTouchResponse.spot.touchedBarGroupIndex == 0){
                                        Navigator.pushNamed(context, ChainMissChart.RouteName);
                                } else if (barTouchResponse.touchInput is FlPanStart && barTouchResponse.spot.touchedBarGroupIndex == 1){
                                        Navigator.pushNamed(context, CategoryMissChart.RouteName);
                                }
                              });
                            },
                            // touchCallback: (barTouchResponse){
                            //   setState(() {
                            //     if(touchedIndex == 0){
                            //       Navigator.pushNamed(context, ChainMissChart.RouteName);
                            //     } else if (touchedIndex == 1){
                            //       Navigator.pushNamed(context, CategoryMissChart.RouteName);
                            //     } else if (touchedIndex == 2){
                            //       Navigator.pushNamed(context, CategoryMissChart.RouteName);
                            //     }
                            //   });
                            // },
                            enabled: true,
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              rotateAngle: 50,
                              showTitles: true,
                              getTextStyles: (value) =>
                                  const TextStyle(color: Color(0xff939393), fontSize: 10),
                              margin: 10,
                              getTitles: (double value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return 'BONJORNO';
                                  case 1:
                                    return 'NESCAFE';
                                  case 2:
                                    return 'COFFEE-MATE';
                                  case 3:
                                    return 'NIDO';
                                  case 4:
                                    return 'BABY FOOD';
                                  case 5:
                                    return 'NESQUIK';
                                  case 6:
                                    return 'MAGGI';
                                  case 7:
                                    return 'CEREAL';
                                  case 8:
                                    return 'CONFECTIONERY';
                                  case 9:
                                    return 'WATER';
                                  default:
                                    return '';
                                }
                              },
                            ),
                            leftTitles: SideTitles(
                              interval: 30,
                              showTitles: true,
                              getTextStyles: (value) => const TextStyle(
                                  color: Color(
                                    0xff939393,
                                  ),
                                  fontSize: 10),
                              margin: 0,
                            ),
                          ),
                          gridData: FlGridData(
                            show: true,
                            checkToShowHorizontalLine: (value) => value % 30 == 0,
                            getDrawingHorizontalLine: (value) => FlLine(
                              color: const Color(0xffe7e8ec),
                              strokeWidth: 1,
                            ),
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          groupsSpace: MediaQuery.of(context).orientation == Orientation.portrait ? 20:60,
                          barGroups: getData(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [ Colors.black12, new Color(0xff64B6FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    margin: EdgeInsets.all(10),
                    //width: MediaQuery.of(context).size.width*0.6,
                    height: 50.0,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_outlined ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          padding: EdgeInsets.all(10.0),
                          color: Colors.lightBlue,
                          textColor: Colors.white,
                          child: Text("Back to Master",
                              style: TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                  ),Container(
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
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.lightBlue)),
                          onPressed: () {
                          },
                          padding: EdgeInsets.all(10.0),
                          color: Color.fromRGBO(0, 160, 227, 1),
                          textColor: Colors.white,
                          child: Text("Send",
                              style: TextStyle(fontSize: 15)),
                        ),
                        Icon(Icons.send)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  List<BarChartGroupData> getData() {
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
    for(var item in missingDataItems){
      String category=item.catename;
      if(category=="BONJORNO"){
        setState(() {
          bonmiss=bonmiss+1;
        });
      }else if(category=="NESCAFE"){
        setState(() {
          nescmiss=nescmiss+1;
        });
      }else if(category=="COFFEE-MATE"){
        setState(() {
          coffmatemiss=coffmatemiss+1;
        });
      }else if(category=="NIDO"){
        setState(() {
          nidomiss=nidomiss+1;
        });
      }else if(category=="BABY FOOD"){
        setState(() {
          babymiss=babymiss+1;
        });
      }else if(category=="NESQUIK"){
        setState(() {
          nesqmiss=nesqmiss+1;
        });
      }else if(category=="MAGGI"){
        setState(() {
          maggimiss=maggimiss+1;
        });
      }else if(category=="CEREAL"){
        setState(() {
          cerealmiss=cerealmiss+1;
        });
      }else if(category=="CONFECTIONERY"){
        setState(() {
          confecmiss=confecmiss+1;
        });
      }else if(category=="WATER"){
        setState(() {
          watermiss=watermiss+1;
        });
      }
    }
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: bonmiss,
              rodStackItems: [
                BarChartRodStackItem(0, 2000000000, Colors.green),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: nescmiss,
              rodStackItems: [
                BarChartRodStackItem(0, 11000000000, Colors.black),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: coffmatemiss,
              rodStackItems: [
                BarChartRodStackItem(0, 6000000000, Colors.grey),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: nidomiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.yellow),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: babymiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.red),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: nesqmiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: maggimiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 7,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: cerealmiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.lightGreen),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 8,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: confecmiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.brown),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 9,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: watermiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.lightBlue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }
/* List<PieChartSectionData> showingSections() {
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
    for(var item in missingDataItems){
      String category=item.catename;
      if(category=="BONJORNO"){
        setState(() {
          bonmiss=bonmiss+1;
        });
      }else if(category=="NESCAFE"){
        setState(() {
          nescmiss=nescmiss+1;
        });
      }else if(category=="COFFEE-MATE"){
        setState(() {
          coffmatemiss=coffmatemiss+1;
        });
      }else if(category=="NIDO"){
        setState(() {
          nidomiss=nidomiss+1;
        });
      }else if(category=="BABY FOOD"){
        setState(() {
          babymiss=babymiss+1;
        });
      }else if(category=="NESQUIK"){
        setState(() {
          nesqmiss=nesqmiss+1;
        });
      }else if(category=="MAGGI"){
        setState(() {
          maggimiss=maggimiss+1;
        });
      }else if(category=="CEREAL"){
        setState(() {
          cerealmiss=cerealmiss+1;
        });
      }else if(category=="CONFECTIONERY"){
        setState(() {
          confecmiss=confecmiss+1;
        });
      }else if(category=="WATER"){
        setState(() {
          watermiss=watermiss+1;
        });
      }
    }

    return List.generate(
      10,
          (i) {
        final isTouched = i == touchedIndex;
        final double opacity = isTouched ? 1 : 0.6;
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: Colors.green.withOpacity(opacity),
              value: bonmiss/missingDataItems.length*100,
              title: 'BONJORNO  (${(bonmiss/missingDataItems.length*100).toStringAsFixed(2)}%)',
              radius: 140,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff044d7c)),
              titlePositionPercentageOffset: 0.55,
            );
          case 1:
            return PieChartSectionData(
              color: Colors.black.withOpacity(opacity),
              value: nescmiss/missingDataItems.length*100,
              title: 'NESCAFE  (${(nescmiss/missingDataItems.length*100).toStringAsFixed(2)}%)',
              radius: 140,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff90672d)),
              titlePositionPercentageOffset: 0.55,
            );
          case 2:
            return PieChartSectionData(
              color:Colors.grey.withOpacity(opacity),
              value: coffmatemiss/missingDataItems.length*100,
              title: 'COFFEE-MATE  (${(coffmatemiss/missingDataItems.length*100).toStringAsFixed(2)}%)',
              radius: 140,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
            );
          case 3:
            return PieChartSectionData(
              color:Colors.yellow.withOpacity(opacity),
              value: nidomiss/missingDataItems.length*100,
              title: 'NIDO  (${(nidomiss/missingDataItems.length*100).toStringAsFixed(2)}%)',
              radius: 140,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
            );
          case 4:
            return PieChartSectionData(
              color:Colors.red.withOpacity(opacity),
              value: babymiss/missingDataItems.length*100,
              title: 'BABY FOOD  (${(babymiss/missingDataItems.length*100).toStringAsFixed(2)}%)',
              radius: 140,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
            );
          case 5:
            return PieChartSectionData(
              color:Colors.blue.withOpacity(opacity),
              value: nesqmiss/missingDataItems.length*100,
              title: 'NESQUIK  (${(nesqmiss/missingDataItems.length*100).toStringAsFixed(2)}%)',
              radius: 140,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
            );
          case 6:
            return PieChartSectionData(
              color:Colors.orange.withOpacity(opacity),
              value: maggimiss/missingDataItems.length*100,
              title: 'MAGGI  (${(maggimiss/missingDataItems.length*100).toStringAsFixed(2)}%)',
              radius: 140,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
            );
          case 7:
            return PieChartSectionData(
              color:Colors.lightGreen.withOpacity(opacity),
              value: cerealmiss/missingDataItems.length*100,
              title: 'CEREAL  (${(cerealmiss/missingDataItems.length*100).toStringAsFixed(2)}%)',
              radius: 140,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
            );
          case 8:
            return PieChartSectionData(
              color:Colors.brown.withOpacity(opacity),
              value: confecmiss/missingDataItems.length*100,
              title: 'CONFECTIONERY  (${(confecmiss/missingDataItems.length*100).toStringAsFixed(2)}%)',
              radius: 140,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
            );
          case 9:
            return PieChartSectionData(
              color:Colors.lightBlue.withOpacity(opacity),
              value: watermiss/missingDataItems.length*100,
              title: 'WATER  (${(watermiss/missingDataItems.length*100).toStringAsFixed(2)}%)',
              radius: 140,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
            );
          default:
            return null;
        }
      },
    );
  }*/
}
