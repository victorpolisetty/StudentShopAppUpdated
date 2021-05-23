import 'package:flutter/foundation.dart';
import 'package:student_shopping/models/itemModel.dart';

class FavoriteModel extends ChangeNotifier {

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<Item> _favoriteItems = [];

  /// List of items in the cart.
  List<Item> get items => _favoriteItems;



  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _favoriteItems.add(item);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void remove(Item item) {
    _favoriteItems.remove(item);
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }
}

