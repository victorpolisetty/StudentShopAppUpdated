import 'package:flutter/material.dart';
import '../Widgets/circleIcon.dart';
import 'package:student_shopping/Categories/specificCategoryPage.dart';


class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: ListView(

        scrollDirection: Axis.horizontal,
        children: [
          Column(
            children: [
              InkWell(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => SpecificCategoryPage('1'))),
              child: CircleIcon(
                Colors.green,
                Icon(
                  Icons.emoji_people_outlined,
                  color: Colors.grey[200],
                  size: 28,
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: Text("Clothes"),
              )    ]
          ),
          Column(
            children: [
              InkWell(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => SpecificCategoryPage('2'))),
                child: CircleIcon(
                  Colors.purple,
                  Icon(
                    Icons.sports_football_outlined,
                    color: Colors.grey[200],
                    size: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: Text("Sports"),
              )
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => SpecificCategoryPage('3'))),
                child: CircleIcon(
                  Colors.yellow,
                  Icon(
                    Icons.book_outlined,
                    color: Colors.grey[200],
                    size: 28,
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: Text("Books"),
              )

            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => SpecificCategoryPage('4'))),
                child: CircleIcon(
                  Colors.red,
                  Icon(
                    Icons.miscellaneous_services,
                    color: Colors.grey[200],
                    size: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: Text("Misc."),
              )
            ],
          ),
        ],
      ),
    );
  }
}
