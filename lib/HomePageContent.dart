import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_shopping/Categories/categories.dart';
import 'ProductFile/recentItems.dart';
import 'Widgets/searchBarWidget.dart';
import 'Widgets/sectionTitleHeader.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            // SearchBarWidget(),
            SectionTitle(title: "Categories"),
            Categories(),
            SectionTitle(title: "Recent Listings"),
            Products(),
        ],
      )
    );
  }
}
