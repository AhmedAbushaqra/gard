import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gard/models/MissingData.dart';
import 'package:gard/provider/ChainProvider.dart';

class Bon_MissChart extends StatefulWidget {
  static const RouteName = "/bonmiss";
  @override
  _Bon_MissChartState createState() => _Bon_MissChartState();
}

class _Bon_MissChartState extends State<Bon_MissChart> {
  List<MissingData> bonjornoMissingDataItems = List<MissingData>();

  void initState() {
    Chains().getBonjornoMissingData().then((missingDataItems) {
      setState(() {
        this.bonjornoMissingDataItems = missingDataItems;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              aspectRatio: 1.66,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0,bottom: 25.0),
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.center,
                      barTouchData: BarTouchData(
                        enabled: true,
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          rotateAngle: 50,
                          showTitles: true,
                          getTextStyles: (value) => const TextStyle(
                              color: Color(0xff939393), fontSize: 10),
                          margin: 10,
                          getTitles: (double value) {
                            switch (value.toInt()) {
                              case 0:
                                return ' Khamsina 2in1';
                              case 1:
                                return '( 6 ) gm Mehwega';
                              case 2:
                                return ' 2in1';
                              case 3:
                                return '2in1Hazelnut';
                              case 4:
                                return ' 2in1 Jar 400g EG';
                              case 5:
                                return 'Mocha';
                              case 6:
                                return ' Latte';
                              case 7:
                                return 'Hazelnut';
                              case 8:
                                return ' Latte Caramel';
                              case 9:
                                return 'Vanilla';
                              case 10:
                                return ' Latte Cinnamon Cocoa';
                              default:
                                return '';
                            }
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (value) => const TextStyle(
                              color: Color(
                                0xff939393,
                              ),
                              fontSize: 10),
                          margin: 10,
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        checkToShowHorizontalLine: (value) => value % 10 == 0,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: const Color(0xffe7e8ec),
                          strokeWidth: 1,
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      groupsSpace: 20,
                      barGroups: getData(),
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
                Column(
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
                            child: Text("Back",
                                style: TextStyle(fontSize: 15)),
                          ),
                        ],
                      ),
                    ),
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
                    ),
                  ],
                ),
                Container(
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
    );
  }

  List<BarChartGroupData> getData() {
    double carrefourMiss = 0;
    double carexpMiss = 0;
    double hiperoneMiss = 0;
    double spinneysMiss = 0;
    double seoudiMiss = 0;
    double ragabsonsMiss = 0;
    double metroMiss = 0;
    double kherzamanMiss = 0;
    double elouthiemMiss = 0;
    double rayaMiss = 0;
    double alfaMiss = 0;

    for (var item in bonjornoMissingDataItems) {
      String chain = item.itemname;
      if (chain == " Khamsina 2in1") {
        setState(() {
          carrefourMiss = carrefourMiss + 1;
        });
      } else if (chain == "( 6 ) gm Mehwega") {
        setState(() {
          carexpMiss = carexpMiss + 1;
        });
      } else if (chain == " 2in1") {
        setState(() {
          hiperoneMiss = hiperoneMiss + 1;
        });
      } else if (chain == "2in1Hazelnut") {
        setState(() {
          spinneysMiss = spinneysMiss + 1;
        });
      } else if (chain == " 2in1 Jar 400g EG") {
        setState(() {
          seoudiMiss = seoudiMiss + 1;
        });
      } else if (chain == "Mocha") {
        setState(() {
          ragabsonsMiss = ragabsonsMiss + 1;
        });
      } else if (chain == " Latte") {
        setState(() {
          metroMiss = metroMiss + 1;
        });
      }
      else if (chain == "Hazelnut") {
        setState(() {
          kherzamanMiss = kherzamanMiss + 1;
        });
      }
      else if (chain == " Latte Caramel") {
        setState(() {
          elouthiemMiss = elouthiemMiss + 1;
        });
      }
      else if (chain == "Vanilla") {
        setState(() {
          rayaMiss = rayaMiss + 1;
        });
      }
      else if (chain == " Latte Cinnamon Cocoa") {
        setState(() {
          alfaMiss = alfaMiss + 1;
        });
      }
    }

    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: carrefourMiss,
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
              y: carexpMiss,
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
              y: hiperoneMiss,
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
              y: spinneysMiss,
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
              y: seoudiMiss,
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
              y: ragabsonsMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.blue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: metroMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 7,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: kherzamanMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.lightGreen),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 8,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: elouthiemMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.brown),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 9,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: rayaMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.lightBlue),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 10,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: alfaMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.purple),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }
  }