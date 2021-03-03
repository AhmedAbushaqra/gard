import 'package:flutter/material.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/selectItem.dart';
import 'package:gard/widgets/List_View_Item.dart';
import 'package:provider/provider.dart';

class Branches extends StatelessWidget {
  static const RouteName = "/Category";
  final List<String> Category=[
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
    final chainData=Provider.of<Chains>(context);
    return Scaffold(
      body:ListView.builder(
          itemBuilder: (ctx,index)=>ListViewItem(
            chainData.branches[index]['id'],
            chainData.branches[index]['BranchName'],
            chainData.imgUrlSelectedPlace,
          ),
        itemCount: chainData.branches.length,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          // Navigator.of(context).pushNamed(selectItem.RouteName,arguments: {
        //  Navigator.of(context).push(MaterialPageRoute(
          //    builder: (context)=>selectItem(items,selectedCategory,selectedSubCategory),
          //));
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
   /* setState(() {
      selectedSubCategory = null;
      selectedCategory = cate;
    });*/
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
   /* setState(() {
      selectedSubCategory = subCate;
    });*/
  }
}