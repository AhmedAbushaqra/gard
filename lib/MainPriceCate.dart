import 'package:flutter/material.dart';

class MainPriceCate extends StatelessWidget {
  static const RouteName = "/MainPriceCate";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/nonfoaming.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Nun foaming mexis',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/foaming.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Foaming',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/inestantcoffe.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Instant Cofee',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/cream.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Creamer',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/powdermilk.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Powder Milk',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/babymilk.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Baby Milk',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/BabyFood.jpg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Baby Food',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/powderchocolate.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Instant Chocolate',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/tabs.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Tabs',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/mixes.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Mixes',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/soup.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Soups',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/cereal.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Cereal',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/chocolate.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Chocolate',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/snak.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Snakes',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/waffer.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Wafer',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/biscuits.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Biscuits',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/RTD.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'RTD',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
          Card(
            shadowColor: Colors.black,
            elevation: 15,
            margin: EdgeInsets.all(8),
            child: Container(
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child:GestureDetector(
                    onTap: (){},
                    child: GridTile(
                      child: Image.asset('images/waterp.jpeg',fit: BoxFit.fill,),
                      // header: ,
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          'Water',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
