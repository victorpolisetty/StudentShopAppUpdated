import 'package:flutter/material.dart';
import 'package:student_shopping/shoppingCart/cart.dart';

class FavoriteProducts extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_picture;
  final product_detail_description;
  final product_categoryId;

  FavoriteProducts({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_picture,
    this.product_detail_description,
    this.product_categoryId,
  });

  @override
  _FavoriteProductsState createState() => _FavoriteProductsState();
}

class _FavoriteProductsState extends State<FavoriteProducts> {
  // Map<String, CartItem> _items = {};

  // void addItem(String pdtid, String name, double price){
  //   if(_items.containsKey(pdtid)){
  //     _items.update(pdtid, (existingCartItem) => CartItem(id: DateTime.now().toString(), name: existingCartItem.name, quantity: existingCartItem.quantity+1, price: existingCartItem.price));
  //   } else {
  //     _items.putIfAbsent(pdtid, () => CartItem(name: name, id:  DateTime.now().toString(), quantity: 1, price: price));
  //   }
  //   setState(() {});
  // }

  var Products_in_cart = [
    {
      "name": "Blazer",
      "picture":"images/cats/a2.jpg",
      "old_price": 120,
      "price": 85,
      "size": "M",
      "color": "Red",
      "Qty.": 2,
    },
    {
      "name": "Shoe",
      "picture":"images/cats/a2.jpg",
      "old_price": 120,
      "price": 85,
      "size": "M",
      "color": "Red",
      "Qty.": 1,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_in_cart.length,
        itemBuilder: (context, index){
          return Single_Favorite_Product(
            // cart_prod_name: widget.product_detail_name[index],
            // cart_prod_qty: widget.product_categoryId[index],
            // cart_prod_price: widget.product_detail_new_price[index],
            // cart_prod_picture: widget.product_detail_picture[index],
            cart_prod_name: Products_in_cart[index]["name"],
            cart_prod_color: Products_in_cart[index]["color"],
            cart_prod_qty: Products_in_cart[index]["Qty."],
            cart_prod_size: Products_in_cart[index]["size"],
            cart_prod_price: Products_in_cart[index]["price"],
            cart_prod_picture: Products_in_cart[index]["picture"],
          );
        });
  }
}
class Single_Favorite_Product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;
  Single_Favorite_Product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_size,
    this.cart_prod_price,
    this.cart_prod_color,
    this.cart_prod_qty,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //=======LEADING SECTION=========
        leading: new Image.asset(cart_prod_picture,width: 80.0,height: 80.0,),
        //============TITLE SECTION============
        title: new Text(cart_prod_name),
        //SUBTITLE SECTION=============
        subtitle: new Column(
          children: <Widget>[
            // ROW INSIDE THE COLUMN
            new Row(
              children: <Widget>[
//          THIS SECTION IS FOR THE SIZE OF THE PRODUCT
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_qty.toString(), style: TextStyle(color:Colors.black),),
                ),
//              =============This section is for the product color==============
                new Padding(padding: const EdgeInsets.fromLTRB(10.0, 8.0, 8.0, 8.0),
                  child: new Text("Qty:"),),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_qty.toString(), style: TextStyle(color:Colors.black),),
                ),
                new Padding(padding: const EdgeInsets.fromLTRB(10.0, 8.0, 8.0, 8.0),
                  child: new Text("Price:"),),
                Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text("\$$cart_prod_price", style:TextStyle(color: Colors.black),)
                ),
              ],
            ),
//        ===============THIS SECTION IS FOR THE PRODUCT PRICE ====================
          ],
        ),
      ),
    );
  }
}
