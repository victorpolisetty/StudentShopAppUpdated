import 'package:flutter/material.dart';
import 'package:student_shopping/Widgets/appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:student_shopping/pages/itemDescription.dart';

class SpecificCategoryPage extends StatefulWidget {
  final String categoryId;
  SpecificCategoryPage(this.categoryId);

  @override
  _SpecificCategoryPageState createState() => _SpecificCategoryPageState();
}

class _SpecificCategoryPageState extends State<SpecificCategoryPage> {

  List data = [];
  Future<String> getData() async {
    var url = Uri.parse('http://10.0.2.2:8080/item/categoryid?id=${widget.categoryId}');
    http.Response response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      data = jsonDecode(response.body) as List;
      print(data);
    } else {
      print (response.statusCode);
    }

    this.setState(() {
    });

    throw 'TODO';
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            iconTheme: new IconThemeData(color: Colors.grey[800], size: 27),
            backgroundColor: Colors.grey[300],
            elevation: .1,
            title: Center(
            child: Text(
            'Student Shopping',
            style: TextStyle(color: Colors.black),
              ),
            ),
            actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
              Icons.search,
              color: Colors.grey[800],
              size: 27,
            ),
          ),
        ],
      ),
        Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-90,
            child: GridView.builder(
                itemCount: data == null ? 0 : data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  // padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                  return Single_prodz(
                    prod_name: data[index]['name'],
                    prod_picture: data[index]['imageURL'],
                    prod_price: data[index]['price'],
                    prod_description: data[index]['description'],
                    prod_categoryId: data[index]['id']);
              }
            )
          ),
        ],
      ),
    );
  }
}

class Single_prodz extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_description;
  final prod_categoryId;
  Single_prodz({
    this.prod_name,
    this.prod_picture,
    this.prod_price,
    this.prod_description,
    this.prod_categoryId,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => new ProductDetails(
                product_detail_name: prod_name,
                product_detail_new_price: prod_price,
                product_detail_picture: prod_picture,
                product_detail_description: prod_description,
                product_categoryId: prod_categoryId,
                //prod_picture ,
              ))),
          child: Container(
            margin: EdgeInsets.only(left: 15),
            width: 150,
            height: 100,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(prod_picture), fit: BoxFit.cover),
                color: Colors.white,
                borderRadius: BorderRadius.circular(18)),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: 150,
          margin: EdgeInsets.only(top: 5, left: 15),
          height: 30,
          child: Text("\$${prod_price}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        ),
        Container(
          alignment: Alignment.topLeft,
          width: 150,
          margin: EdgeInsets.only(top: 5, left: 15),
          height: 40,
          child: Text("${prod_name}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
