import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gard/Charts/Bon.MissChart.dart';
import 'package:gard/Charts/selectCategoryChart.dart';
import 'package:gard/models/MissingData.dart';
import 'package:gard/provider/ChainProvider.dart';

class CategoryMissChart extends StatefulWidget {
  static const RouteName = "/CategoryMissChart";
  String cateAnalysis;
  CategoryMissChart({this.cateAnalysis});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50.0,
            child: RaisedButton(
               /* Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                SelectCategoryChart(
               bonmiss: bonmiss,nescmiss: nescmiss,coffmatemiss: coffmatemiss,nidomiss: nidomiss,babymiss: babymiss,
               nesqmiss:nesqmiss,maggimiss: maggimiss,cerealmiss: cerealmiss,confecmiss: confecmiss,watermiss: watermiss,
                )));*/
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(List: [new Color(0xff374ABE), new Color(0xff64B6FF)],
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
                          widget.cateAnalysis,
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
                                  return 'Carrefour';
                                case 1:
                                  return 'Carrefour Express';
                                case 2:
                                  return 'Hipper one';
                                case 3:
                                  return 'Spinneys';
                                case 4:
                                  return 'Seoudi';
                                case 5:
                                  return 'Ragab sons';
                                case 6:
                                  return 'Metro';
                                case 7:
                                  return 'Kher zaman';
                                case 8:
                                  return 'El otheim';
                                case 9:
                                  return 'Raya';
                                case 10:
                                  return 'Alfa';
                                case 11:
                                  return 'El Mahalawy';
                                case 12:
                                  return 'Panda';
                                case 13:
                                  return 'El Hawary';
                                case 14:
                                  return 'Oscar';
                                case 15:
                                  return 'Lulu';
                                case 16:
                                  return 'Fathalla gomla market';
                                case 17:
                                  return 'Beit el gomla';
                                case 18:
                                  return 'Fathalla';
                                case 19:
                                  return 'Aswak fathalla mini';
                                case 20:
                                  return 'Zahran';
                                case 21:
                                  return 'Fresh food';
                                case 22:
                                  return 'Royal house';
                                case 23:
                                  return 'Mart ville';
                                case 24:
                                  return 'Premier';
                                default:
                                  return '';
                              }
                            },
                          ),
                          leftTitles: SideTitles(
                           // interval: 10,
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
                          checkToShowHorizontalLine: (value) => value % 10 == 0,
                          getDrawingHorizontalLine: (value) => FlLine(
                            color: const Color(0xffe7e8ec),
                            strokeWidth: 1,
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        groupsSpace: MediaQuery.of(context).size.width*0.015,
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
                      gradient: LinearGradient(List: [ Colors.black12, new Color(0xff64B6FF)],
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
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(List: [new Color(0xff64B6FF),Colors.black12,],
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
    double elmahalwyMiss = 0;
    double pandaMiss = 0;
    double elhawaryMiss = 0;
    double oscarMiss = 0;
    double luluMiss = 0;
    double fatgomarketMiss = 0;
    double beitgomlaMiss = 0;
    double fathallaMiss = 0;
    double aswakfatminiMiss = 0;
    double zahranMiss = 0;
    double freshfoodMiss = 0;
    double royalhouseMiss = 0;
    double marthvileMiss = 0;
    double perimerMiss = 0;

    for (var item in missingDataItems) {
      String chain = item.chain;
      String category=item.catename;
      if(category==widget.cateAnalysis) {
        if (chain == "Carrefour") {
          setState(() {
            carrefourMiss = carrefourMiss + 1;
          });
        } else if (chain == "Carrefour Express") {
          setState(() {
            carexpMiss = carexpMiss + 1;
          });
        } else if (chain == "Hipper one") {
          setState(() {
            hiperoneMiss = hiperoneMiss + 1;
          });
        } else if (chain == "Spinneys") {
          setState(() {
            spinneysMiss = spinneysMiss + 1;
          });
        } else if (chain == "Seoudi") {
          setState(() {
            seoudiMiss = seoudiMiss + 1;
          });
        } else if (chain == "Ragab sons") {
          setState(() {
            ragabsonsMiss = ragabsonsMiss + 1;
          });
        } else if (chain == "Metro") {
          setState(() {
            metroMiss = metroMiss + 1;
          });
        }
        else if (chain == "Kher zaman") {
          setState(() {
            kherzamanMiss = kherzamanMiss + 1;
          });
        }
        else if (chain == "El otheim") {
          setState(() {
            elouthiemMiss = elouthiemMiss + 1;
          });
        }
        else if (chain == "Raya") {
          setState(() {
            rayaMiss = rayaMiss + 1;
          });
        }
        else if (chain == "Alfa") {
          setState(() {
            alfaMiss = alfaMiss + 1;
          });
        }
        else if (chain == "El Mahalawy") {
          setState(() {
            elmahalwyMiss = elmahalwyMiss + 1;
          });
        }
        else if (chain == "Panda") {
          setState(() {
            pandaMiss = pandaMiss + 1;
          });
        } else if (chain == "El Hawary") {
          setState(() {
            elhawaryMiss = elhawaryMiss + 1;
          });
        }
        else if (chain == "Oscar") {
          setState(() {
            oscarMiss = oscarMiss + 1;
          });
        } else if (chain == "Lulu") {
          setState(() {
            luluMiss = luluMiss + 1;
          });
        } else if (chain == "Fathalla gomla market") {
          setState(() {
            fatgomarketMiss = fatgomarketMiss + 1;
          });
        } else if (chain == "Beit el gomla") {
          setState(() {
            beitgomlaMiss = beitgomlaMiss + 1;
          });
        }
        else if (chain == "Fathalla") {
          setState(() {
            fathallaMiss = fathallaMiss + 1;
          });
        }
        else if (chain == "Aswak fathalla mini") {
          setState(() {
            aswakfatminiMiss = aswakfatminiMiss + 1;
          });
        }
        else if (chain == "Zahran") {
          setState(() {
            zahranMiss = zahranMiss + 1;
          });
        }
        else if (chain == "Fresh food") {
          setState(() {
            freshfoodMiss = freshfoodMiss + 1;
          });
        }
        else if (chain == "Royal house") {
          setState(() {
            royalhouseMiss = royalhouseMiss + 1;
          });
        } else if (chain == "Mart ville") {
          setState(() {
            marthvileMiss = marthvileMiss + 1;
          });
        } else if (chain == "Premier") {
          setState(() {
            perimerMiss = perimerMiss + 1;
          });
        }
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
      BarChartGroupData(
        x: 11,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: elmahalwyMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.cyan),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 12,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: pandaMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.teal),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 13,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: elhawaryMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.pink),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 14,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: oscarMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.amber),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 15,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: luluMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.black),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 16,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: fatgomarketMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.orange),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 17,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: beitgomlaMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.green),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 18,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: fathallaMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.teal),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 19,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: aswakfatminiMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.blueGrey),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 20,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: zahranMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.cyan),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 21,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: freshfoodMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.pinkAccent),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 22,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: royalhouseMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.lightGreenAccent),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 23,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: marthvileMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.lime),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 24,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
              y: perimerMiss,
              rodStackItems: [
                BarChartRodStackItem(0, 1000000000.5, Colors.indigo),
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
