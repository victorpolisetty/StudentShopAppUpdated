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
                icon: Icon(
                  Icons.emoji_people_outlined,
                  color: Colors.grey[200],
                  size: 28,
                ),
                color: Colors.green[400],

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
                  icon: Icon(
                    Icons.sports_football_outlined,
                    color: Colors.grey[200],
                    size: 28,
                  ),
                  color: Colors.purple[500],
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
                  icon: Icon(
                    Icons.book_outlined,
                    color: Colors.grey[200],
                    size: 28,
                  ),
                  color: Colors.yellow[800],
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
                  icon: Icon(
                    Icons.miscellaneous_services,
                    color: Colors.grey[200],
                    size: 28,
                  ),
                  color: Colors.red[800],
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
