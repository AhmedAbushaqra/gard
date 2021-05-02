import 'package:flutter/material.dart';

class TopDroppedItems extends StatelessWidget {
  static const RouteName = "/TopDroppedItem";
  var topThreeMis=[];
  TopDroppedItems({this.topThreeMis});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Dropped Items'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('%ofMis'),
                Container(
                  color: Colors.grey,
                  width: 1,
                  height: 20,
                ),
                Text('#MisTime')
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
              height: 70,
              width: 100,
              //child: Image.asset(topThreeMis[0]['pic'],scale: 1.5,),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(topThreeMis[0]['pic'],),
                ),
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(18)),
                boxShadow: [
                  BoxShadow(blurRadius: 10),
                ],
              ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  child: Text(topThreeMis[0]['name'],style: TextStyle(fontSize: 21),)),
              Container(
                // margin: const EdgeInsets.all(30.0),
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "${(topThreeMis[0]['count']/topThreeMis[0]['precentage']*100).toStringAsFixed(2)}%",
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
              Container(
                // margin: const EdgeInsets.all(30.0),
                padding: EdgeInsets.all(3.0),
                child: Text(
                  topThreeMis[0]['count'].toString(),
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
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 70,
                width: 100,
                //child: Image.asset(topThreeMis[0]['pic'],scale: 1.5,),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(topThreeMis[1]['pic'],),
                  ),
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  boxShadow: [
                    BoxShadow(blurRadius: 10),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  child: Text(topThreeMis[1]['name'],style: TextStyle(fontSize: 21),)),
              Container(
                // margin: const EdgeInsets.all(30.0),
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "${(topThreeMis[1]['count']/topThreeMis[1]['precentage']*100).toStringAsFixed(2)}%",
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
              Container(
                // margin: const EdgeInsets.all(30.0),
                padding: EdgeInsets.all(3.0),
                child: Text(
                  topThreeMis[1]['count'].toString(),
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
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 70,
                width: 100,
                //child: Image.asset(topThreeMis[0]['pic'],scale: 1.5,),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(topThreeMis[2]['pic'],),
                  ),
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  boxShadow: [
                    BoxShadow(blurRadius: 10),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  child: Text(topThreeMis[2]['name'],style: TextStyle(fontSize: 21),)),
              Container(
                // margin: const EdgeInsets.all(30.0),
                padding: EdgeInsets.all(3.0),
                child: Text(
                  "${(topThreeMis[2]['count']/topThreeMis[2]['precentage']*100).toStringAsFixed(2)}%",
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
              Container(
                // margin: const EdgeInsets.all(30.0),
                padding: EdgeInsets.all(3.0),
                child: Text(
                  topThreeMis[2]['count'].toString(),
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
        ],
      ),
    );
  }
}
