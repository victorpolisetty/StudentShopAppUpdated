import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'itemModel.g.dart';
@JsonSerializable()
class ItemPage{
  List<Item> itemList = [];
  List<Item> get items => itemList;

  ItemPage(List<Item> itemList){
    this.itemList = itemList;
  }
  factory ItemPage.fromJson(Map<String, dynamic> parsedJson) => _$ItemPageFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$ItemPageToJson(this);
}
@JsonSerializable()
class Item {
  String name = "";
  String imageURL = "";
  String price = "";
  String description = "";
  String id = "";
  Item(String id, String name, String price, String imageURL, String description){
    this.id = id;
    this.name = name;
    this.price = price;
    this.imageURL = imageURL;
    this.description = description;
  }

  factory Item.fromJson(Map<String, dynamic> parsedJson) => _$ItemFromJson(parsedJson);
  Map<String, dynamic> toJson() => _$ItemToJson(this);

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
  List <Item> itemList = [];
}





