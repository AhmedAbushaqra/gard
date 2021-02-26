import 'package:flutter/material.dart';
import 'package:gard/selectItem.dart';

class category extends StatefulWidget {
  static const RouteName = "/Category";
  @override
  _categoryState createState() => _categoryState();
}

class _categoryState extends State<category> {
  final List<String> category=[
    'BONJORNO',
    'NESQUIK',
    'WATER',
  ];
  final List<String> bonjornoSub=[
    'Bon.Mixes',
    'Bon.Cappuuccino',
  ];
  var BonMixItems=[
  {
    'name':'khamsina2in1',
    'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
  },
    {
      'name':'2in1',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg',
    },
{
  'name':'2in1Hazelnut',
  'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg',
}
  ];
  var BonCappItems=[
    {
      'name':'mocha',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'latte',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'vanilla',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  final List<String> nesquikSub=[
    'Powder',
    'RTD',
  ];
  var NesPowderItems=[
    {
      'name':'NESQUIK 880g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'NESQUIK 330g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'NESQUIK 154g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  var NesRTDItems=[
    {
      'name':'Chocolate RTD ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'Strawbery Milk RTD ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  final List<String> waterSub=[
    'Water',
  ];
  var waterItems=[
    {
      'name':'Baraka 1 L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'Baraka 0.6 L ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'Baraka Shrink 6 L ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  List<String> subCategory = [];
  var items;
  String selectedCategory;
  String selectedSubCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height*0.3,
            child: ListView(
              children: [
                Container(
                  height: 65,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Category',
                      labelStyle: Theme.of(context)
                          .primaryTextTheme
                          .caption
                          .copyWith(color: Colors.black,fontSize: 18),
                      border: const OutlineInputBorder(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        /// place dropdown
                        hint: Text('Select Category'),
                        value: selectedCategory,
                        isExpanded: true,
                        items: category.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: onChangedCallback,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 65,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Sub.Category',
                      labelStyle: Theme.of(context)
                          .primaryTextTheme
                          .caption
                          .copyWith(color: Colors.black,fontSize: 18),
                      border:  OutlineInputBorder(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        /// branch dropdown
                        hint: Text('Select Sub.Category'),
                        isExpanded: true,
                        value: selectedSubCategory,
                        items: subCategory.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: onChangedSecondCallback,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
         // Navigator.of(context).pushNamed(selectItem.RouteName,arguments: {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=>selectItem(items,selectedCategory,selectedSubCategory),
          ));
        },
        icon: Icon(Icons.save),
        label: Text("Save"),
      ),
    );
  }



  void onChangedCallback(cate) {
    if (cate == 'BONJORNO') {
      subCategory = bonjornoSub;
    } else if (cate == 'NESQUIK') {
      subCategory = nesquikSub;
    } else if (cate == 'WATER') {
      subCategory = waterSub;
    } else {
      subCategory = [];
    }
    setState(() {
      selectedSubCategory = null;
      selectedCategory = cate;
    });
  }
  void onChangedSecondCallback(subCate) {
    if(subCate=='Bon.Mixes'){
      items=BonMixItems;
    }else if(subCate=='Bon.Cappuuccino'){
      items=BonCappItems;
    }else if(subCate=='Powder'){
      items=NesPowderItems;
    }else if(subCate=='RTD'){
      items=NesRTDItems;
    }else if(subCate=='Water'){
      items=waterItems;
    }
    setState(() {
      selectedSubCategory = subCate;
    });
  }
}