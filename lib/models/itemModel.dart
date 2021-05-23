import 'package:flutter/cupertino.dart';
class Item {
  String name;
  String imageURL;
  String price;
  String description;
  String id;
  Item(String id, String name, String price, String imageURL, String description){
    this.name = name;
    this.id = id;
    this.price = price;
    this.imageURL = imageURL;
    this.description = description;
  }
  @override
  bool operator ==(other) {
    if (other is Item) {
      return other.id == id;
    } else {
      return false;
    }
  }
}
class ItemModel extends ChangeNotifier{
  List <Item> itemList;


}





