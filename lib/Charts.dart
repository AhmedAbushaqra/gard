import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gard/models/ExpiryData.dart';
import 'package:gard/widgets/indicator.dart';

import 'provider/ChainProvider.dart';

class Charts extends StatefulWidget {
  static const RouteName = "/Charts";
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  List<ExpiryData> expiryDataItems = List<ExpiryData>();
  int touchedIndex;
  bool missing = false;


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
    int index;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.15,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Indicator(
                  color:  Colors.green,
                  text: 'Full Capacity',
                  isSquare: false,
                  size: touchedIndex == 0 ? 18 : 16,
                  textColor: touchedIndex == 0 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: Colors.yellow,
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
          Expanded(
            child: AspectRatio(
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
                    sections: showingSections(index)),
              ),
            ),
          ),
        ],
      ),
      // body: ListView.builder(
      //   itemCount: expiryDataItems.length,
      //   itemBuilder: (context, index){
      //     return ListTile(
      //       title: Text("${expiryDataItems[index].} ${expiryDataItems[index].chain}"),
      //     );
      //   },
      // ),
    );
  }
  List<PieChartSectionData> showingSections(int index) {

    DateTime now = DateTime.now();
    for(var item in expiryDataItems){
      DateTime exDate = DateTime.parse(item.expirydate);
      if(exDate.isAfter(now)){
        setState(() {
          missing = true;
        });
      }
    }

    return List.generate(expiryDataItems.length, (index) => PieChartSectionData(
                    color: missing && index == 1 ? Colors.red:Colors.yellow,
                    value: double.parse(expiryDataItems[index].count)/expiryDataItems.length*100,
                    title: '${expiryDataItems[index].itemname}',
                    radius: 150,
                    titleStyle: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    titlePositionPercentageOffset: 0.5,
    ));

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
