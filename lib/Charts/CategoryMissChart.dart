import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gard/models/MissingData.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/widgets/indicator.dart';

class CategoryMissChart extends StatefulWidget {
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
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
    Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height*0.15,
    child: Column(
      children: [
        Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
        Indicator(
        color:  Colors.green,
        text: 'BONJORNO',
        isSquare: false,
        size: touchedIndex == 0 ? 18 : 16,
        textColor: touchedIndex == 0 ? Colors.black : Colors.grey,
        ),
        Indicator(
        color: Colors.black,
        text: 'NESCAFE',
        isSquare: false,
        size: touchedIndex == 1 ? 18 : 16,
        textColor: touchedIndex == 1 ? Colors.black : Colors.grey,
        ),
        Indicator(
        color: Colors.grey,
        text: 'COFFEE-MATE',
        isSquare: false,
        size: touchedIndex == 2 ? 18 : 16,
        textColor: touchedIndex == 2 ? Colors.black : Colors.grey,
        ),
        ],
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Indicator(
              color:  Colors.yellow,
              text: 'NIDO',
              isSquare: false,
              size: touchedIndex == 3 ? 18 : 16,
              textColor: touchedIndex == 3 ? Colors.black : Colors.grey,
            ),
            Indicator(
              color: Colors.red,
              text: 'BABY FOOD',
              isSquare: false,
              size: touchedIndex == 4 ? 18 : 16,
              textColor: touchedIndex == 4 ? Colors.black : Colors.grey,
            ),
            Indicator(
              color: Colors.blue,
              text: 'NESQUIK',
              isSquare: false,
              size: touchedIndex == 5 ? 18 : 16,
              textColor: touchedIndex == 5 ? Colors.black : Colors.grey,
            ),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Indicator(
              color:  Colors.orange,
              text: 'MAGGI',
              isSquare: false,
              size: touchedIndex == 6 ? 18 : 16,
              textColor: touchedIndex == 6 ? Colors.black : Colors.grey,
            ),
            Indicator(
              color: Colors.lightGreen,
              text: 'CEREAL',
              isSquare: false,
              size: touchedIndex == 7 ? 18 : 16,
              textColor: touchedIndex == 7 ? Colors.black : Colors.grey,
            ),
            Indicator(
              color: Colors.brown,
              text: 'CONFECTIONERY',
              isSquare: false,
              size: touchedIndex == 8 ? 18 : 16,
              textColor: touchedIndex == 8 ? Colors.black : Colors.grey,
            ),
          ],
        ),
        SizedBox(height: 5,),
        Indicator(
          color: Colors.lightBlue,
          text: 'WATER',
          isSquare: false,
          size: touchedIndex == 9 ? 18 : 16,
          textColor: touchedIndex == 9 ? Colors.black : Colors.grey,
        ),
      ],
    ),
    ),
    AspectRatio(
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
  ]
    );
  }
  List<PieChartSectionData> showingSections() {
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
  }
}
