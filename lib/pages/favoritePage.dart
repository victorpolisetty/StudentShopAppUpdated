import 'package:flutter/material.dart';

import '../Widgets/appbar.dart';

class favoritePage extends StatefulWidget {
  @override
  _favoritePageState createState() => _favoritePageState();
}

class _favoritePageState extends State<favoritePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyAppBar(),
        ],
      ),
    ); 
  }
}
