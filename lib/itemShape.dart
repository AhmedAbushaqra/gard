import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gard/models/product.dart';

class itemShape extends StatefulWidget {
  final String name;
  final String imgUrl;
  final String selectedCate;
  final String selectedSubCate;

  itemShape(this.name,this.imgUrl,this.selectedCate,this.selectedSubCate);

  @override
  _itemShapeState createState() => _itemShapeState();
}

class _itemShapeState extends State<itemShape> {
  List<Product> productList = [];
  bool _isSelected=false;

  void deleteProduct(String name){
  // final existingProductIndex=productList.indexWhere((prod) =>  prod.name==name);
   //var existingProduct=productList[existingProductIndex];
   productList.removeWhere((prod) =>  prod.name==name);
  // print(existingProduct.name);
  }
  @override
  Widget build(BuildContext context) {
    return _isSelected?Padding(
      padding: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child:GestureDetector(
          onTap: (){
            setState(() {
              deleteProduct(widget.name);
              _isSelected=!_isSelected;
            });
            print(productList.length);
          },
          child: GridTile(
            child: Container(
              color: Colors.black54,
                height: 50,
                child: Image.network(widget.imgUrl,fit: BoxFit.cover,)),
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(
               widget.name,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    )
        :ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child:GestureDetector(
        onTap: (){
          setState(() {
            productList = [
              Product(
                category: widget.selectedCate,
                subCategory: widget.selectedSubCate,
                name: widget.name,
                imgUrl: widget.imgUrl,
              )
            ];
            print(productList.first.name.toString());
            _isSelected=!_isSelected;
          });
        },
        child: GridTile(
          child: Image.network(widget.imgUrl,fit: BoxFit.cover,),
          // header: ,
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              widget.name,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
