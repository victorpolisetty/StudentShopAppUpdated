import 'package:flutter/material.dart';
import 'package:student_shopping/shoppingCart/favoriteItem.dart';

import '../Widgets/appbar.dart';

class favoritePageTab extends StatefulWidget {
  @override
  _favoritePageTabState createState() => _favoritePageTabState();
}

class _favoritePageTabState extends State<favoritePageTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.grey[800], size: 27),
        backgroundColor: Colors.grey[300],
        elevation: .1,
        title: Center(
          child: Text(
            'Favorites',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
          ),
        ],
      ),
      body: FavoriteItem()
    );

  }
}
