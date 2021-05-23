import 'package:flutter/material.dart';
import 'package:student_shopping/Widgets/appbar.dart';
import 'package:student_shopping/HomePageContent.dart';

class homePageTab extends StatelessWidget {
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
