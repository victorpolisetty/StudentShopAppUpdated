import 'package:flutter/material.dart';
import 'package:student_shopping/ProfileFile/sellerShop.dart';
import 'package:student_shopping/Widgets/FavoriteWidget.dart';
import 'package:student_shopping/shoppingCart/favoriteItem.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_picture;
  final product_detail_description;
  final product_categoryId;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_picture,
    this.product_detail_description,
    this.product_categoryId,
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    var isAlwaysTrue = true;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.grey[800], size: 27),
        backgroundColor: Colors.grey[300],
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
                  boxShadow: [BoxShadow(spreadRadius: 0, blurRadius: 19, offset: Offset(0, 4), color: Colors.grey[400])],
                  image: DecorationImage(image: NetworkImage(widget.product_detail_picture), fit: BoxFit.cover)
                ),

              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 15, top: 15),
                child: Text(widget.product_detail_name,style: TextStyle(fontSize: 19, color: Colors.grey[700]),textAlign: TextAlign.left,)
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 15, top: 15),
                  child: Text('\$${widget.product_detail_new_price}',style: TextStyle(fontSize: 19, color: Colors.grey[700]),textAlign: TextAlign.left,)
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 15, top: 15),
                  child: Text('Description',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey[700]),textAlign: TextAlign.left,)
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 15, top: 15),
                  child: Text(widget.product_detail_description,style: TextStyle(fontSize: 15, color: Colors.grey[700]),textAlign: TextAlign.left,)
              ),
            ],
          ),
        ),
      ),
bottomNavigationBar: Container(
  width: MediaQuery.of(context).size.width,
  height: 100,
  child: Container(
    margin: EdgeInsets.only(left: 10, right:10, bottom: 10),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Text(
            "Send Message",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        InkWell(
          //todo: update list
          child: Container(
            child: FavoriteWidget(),
          ),
        ),
      ],
    ),
  ),
),
    );
  }
}

