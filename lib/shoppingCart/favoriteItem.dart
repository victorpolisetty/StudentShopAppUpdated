import 'package:flutter/material.dart';
import 'package:student_shopping/shoppingCart/favoriteItemBuilder.dart';

class FavoriteItem extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_picture;
  final product_detail_description;
  final product_categoryId;

  FavoriteItem({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_picture,
    this.product_detail_description,
    this.product_categoryId,
  });
  @override
  _FavoriteItemState createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new FavoriteProducts(
        product_detail_name: widget.product_detail_name,
        product_detail_new_price: widget.product_detail_new_price,
        product_detail_picture: widget.product_detail_picture,
        product_detail_description: widget.product_detail_description,
        product_categoryId: widget.product_categoryId,
      ),
    );
  }
}
