import 'package:flutter/material.dart';
import 'package:student_shopping/ProductFile/addListing.dart';
import 'package:student_shopping/Widgets/homePageTab.dart';
import 'package:student_shopping/pages/favoritePage.dart';
import 'ProfileFile/sellerShop.dart';
import 'package:student_shopping/Messaging/chat_screen.dart';

//import 'package:firebase_auth/firebase_auth.dart';


class HomePage extends StatefulWidget {
  String title;
  HomePage(this.title);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> tabs = [
    homePageTab(),
    favoritePageTab(),
    addListing(),
    ChatScreen(),
    sellerShopTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body:
          tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,), label: "My Favorites",),
          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart,), label: "Add Listing",),
          BottomNavigationBarItem(icon: Icon(Icons.message,), label: "Messaging",),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,),
    );
  }
}
