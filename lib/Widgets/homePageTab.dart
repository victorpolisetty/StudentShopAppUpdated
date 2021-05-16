import 'package:flutter/material.dart';
import 'package:student_shopping/Widgets/appbar.dart';
import 'package:student_shopping/HomePageContent.dart';

class homePageTab extends StatefulWidget {
  @override
  _homePageTabState createState() => _homePageTabState();
}

class _homePageTabState extends State<homePageTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyAppBar(),
          HomePageBody(),
        ],
      ),
    );
  }
}
