import 'package:flutter/foundation.dart';
import 'package:student_shopping/models/itemModel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class RecentItemModel extends ChangeNotifier {
  /// Internal, private state of the cart. Stores the ids of each item.
  List<Item> _recentItems = [];
  /// List of items in the cart.
  List<Item> get items => _recentItems;



  Future<void> init() async {
    Map<String, dynamic> data;
    var url = Uri.parse('http://10.0.2.2:8080/categories/1/items');
    http.Response response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      // data.map<Item>((json) => Item.fromJson(json)).toList();
      data = jsonDecode(response.body);
      _recentItems = ItemPage.fromJson(data).items;
      print(_recentItems);
    } else {
      print (response.statusCode);
    }
  }

  RecentItemModel(){
    var initFuture = init();
    initFuture.then((voidValue) {
      // state = HomeScreenModelState.initialized;
      notifyListeners();
    });
  }
  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _recentItems.add(item);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void remove(Item item) {
    _recentItems.remove(item);
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }
}

