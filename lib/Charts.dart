import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gard/Charts/CategoryMissChart.dart';
import 'package:gard/Charts/ChainMissChart.dart';
import 'package:gard/widgets/indicator.dart';

import 'models/final_data.dart';
import 'provider/ChainProvider.dart';

class Charts extends StatefulWidget {
  static const RouteName = "/Charts";
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  List<FinalData> DataItems = List<FinalData>();
  int touchedIndex;
  @override
  void initState() {
    Chains().getFinalData().then((DataItems) {
      setState(() {
        this.DataItems = DataItems;
      });
    });
    super.initState();
  }

  //  _sectionTapped(int index){
  //   touchedIndex = index;
  // }

  @override
  Widget build(BuildContext context) {
    int index;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.15,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Indicator(
                    color:  Colors.grey,
                    text: 'Full Capacity',
                    isSquare: false,
                    size: touchedIndex == 0 ? 18 : 16,
                    textColor: touchedIndex == 0 ? Colors.black : Colors.grey,
                  ),
                  Indicator(
                    color: Colors.green,
                    text: 'Start Missing',
                    isSquare: false,
                    size: touchedIndex == 1 ? 18 : 16,
                    textColor: touchedIndex == 1 ? Colors.black : Colors.grey,
                  ),
                  Indicator(
                    color: Colors.red,
                    text: 'Missing',
                    isSquare: false,
                    size: touchedIndex == 2 ? 18 : 16,
                    textColor: touchedIndex == 2 ? Colors.black : Colors.grey,
                  ),
                ],
              ),
            ),
            DataItems.isEmpty?Container(
                 padding: EdgeInsets.only(top: 100,bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.warning_amber_rounded,color: Colors.red,),
                    Text("Waiting Data",style: TextStyle(color:Colors.red,fontSize: 18),),
                  ],
                ))
                :AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                    pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                      setState(() {

                        if (pieTouchResponse.touchInput is FlLongPressEnd ||
                            pieTouchResponse.touchInput is FlPanEnd) {
                          touchedIndex = -1;
                        } else {
                          touchedIndex = pieTouchResponse.touchedSectionIndex;
                        }
                      });
                    }),
                    startDegreeOffset: 180,
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 5,
                    centerSpaceRadius: 0,
                    sections: showingSections()),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width*0.6,
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pushNamed(CategoryMissChart.RouteName);
                      });
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Color.fromRGBO(0, 160, 227, 1),
                    textColor: Colors.white,
                    child: Text("Item Side Of View",
                        style: TextStyle(fontSize: 15)),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width*0.6,
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                    onPressed: () {
                      Navigator.pushNamed(context, ChainMissChart.RouteName);
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Color.fromRGBO(0, 160, 227, 1),
                    textColor: Colors.white,
                    child: Text("Chain Side Of View",
                        style: TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  List<PieChartSectionData> showingSections() {
    double FullCapacity=0;
    double StartMissing=0;
    double Missing=0;
    for(var item in DataItems){
      String capecity=item.capacity;
      if(capecity=="Full Capacity"){
        setState(() {
          FullCapacity=FullCapacity+1;
        });
      }else if(capecity=="Start Missing"||capecity=='Start missing'){
        setState(() {
          StartMissing=StartMissing+1;
        });
      }else if(capecity=="Missing"){
        setState(() {
          Missing=Missing+1;
        });
      }
    }

    return List.generate(
      3,
          (i) {
        final isTouched = i == touchedIndex;
        final double opacity = isTouched ? 1 : 0.6;
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: Colors.grey.withOpacity(opacity),
              value: FullCapacity/DataItems.length*100,
              title: 'Full Capacity  (${(FullCapacity/DataItems.length*100).toStringAsFixed(2)}%)',
              radius: 140,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff044d7c)),
              titlePositionPercentageOffset: 0.55,
            );
          case 1:
            return PieChartSectionData(
              color: Colors.green.withOpacity(opacity),
              value: StartMissing/DataItems.length*100,
              title: 'Start Missing  (${(StartMissing/DataItems.length*100).toStringAsFixed(2)}%)',
              radius: 140,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff90672d)),
              titlePositionPercentageOffset: 0.55,
            );
          case 2:
            return PieChartSectionData(
              color:Colors.red.withOpacity(opacity),
              value: Missing/DataItems.length*100,
              title: 'Missing  (${(Missing/DataItems.length*100).toStringAsFixed(2)}%)',
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



    /* DateTime now = DateTime.now();
    for(var item in expiryDataItems){
      DateTime exDate = DateTime.parse(item.expirydate);
      if(exDate.isAfter(now)){
        setState(() {
          missing = true;
        });
      }
    }*/

   /* return List.generate(expiryDataItems.length, (index) => PieChartSectionData(
                    color: missing && index == 1 ? Colors.red:Colors.yellow,
                    value: double.parse(expiryDataItems[index].count)/expiryDataItems.length*100,
                    title: '${expiryDataItems[index].itemname}',
                    radius: 150,
                    titleStyle: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    titlePositionPercentageOffset: 0.5,
    ));*/

    // return List.generate(
    //   expiryDataItems.length,
    //       (index) {
    //     final isTouched = index == touchedIndex;
    //     for(var item in expiryDataItems){
    //       return PieChartSectionData(
    //               color: Colors.green,
    //               value: double.parse(item.branchid),
    //               title: '${item.itemname}',
    //               radius: 150,
    //               titleStyle: TextStyle(
    //                   fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    //               titlePositionPercentageOffset: 0.5,
    //       );
    //     }
    //     return null;
    //     // switch (i) {
    //     //   case 0:
    //     //     return PieChartSectionData(
    //     //       color: Colors.green,
    //     //       value: 60,
    //     //       title: '${expiryDataItems[index].itemname}',
    //     //       radius: 150,
    //     //       titleStyle: TextStyle(
    //     //           fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    //     //       titlePositionPercentageOffset: 0.5,
    //     //     );
    //     //   case 1:
    //     //     return PieChartSectionData(
    //     //       color: Colors.yellow,
    //     //       value: 30,
    //     //       title: 'NESCAFE',
    //     //       radius: 150,
    //     //       titleStyle: TextStyle(
    //     //           fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    //     //       titlePositionPercentageOffset: 0.6,
    //     //     );
    //     //   case 2:
    //     //     return PieChartSectionData(
    //     //       color: Colors.red,
    //     //       value: 10,
    //     //       title: 'NIDO',
    //     //       radius: 150,
    //     //       titleStyle: TextStyle(
    //     //           fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    //     //       titlePositionPercentageOffset: 0.6,
    //     //     );
    //     // // case 3:
    //     // //   return PieChartSectionData(
    //     // //     color: const Color(0xff13d38e).withOpacity(opacity),
    //     // //     value: 25,
    //     // //     title: '',
    //     // //     radius: 70,
    //     // //     titleStyle: TextStyle(
    //     // //         fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff0c7f55)),
    //     // //     titlePositionPercentageOffset: 0.55,
    //     // //   );
    //     //   default:
    //     //     return null;
    //     // }
    //   },
    // );
  }
}
