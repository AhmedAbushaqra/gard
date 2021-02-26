import 'package:flutter/material.dart';
import 'itemShape.dart';

class selectItem extends StatefulWidget {
  static const RouteName = "/selectItem";
  var Items;
  String selectedCate;
  String selectedSubCate;

  selectItem(this.Items,this.selectedCate,this.selectedSubCate, {Key key,}): super(key: key);
  @override
  _selectItemState createState() => _selectItemState();
}

class _selectItemState extends State<selectItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: widget.Items.length,
          itemBuilder: (ctx,i)=>itemShape(widget.Items[i]['name'],widget.Items[i]['imgUrl'],widget.selectedCate,widget.selectedSubCate),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
