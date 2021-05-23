import 'package:flutter/material.dart';
import 'package:student_shopping/pages/itemDescription.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:student_shopping/models/itemModel.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List data;
  Future<String> getData() async {
    var url = Uri.parse('http://10.0.2.2:8080/items/');
    http.Response response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      data = jsonDecode(response.body) as List;
      print(data);
    } else {
      print (response.statusCode);
    }

    this.setState(() {
    });

  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width,
        height: 280,
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
            }));
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
            child: Container(
              margin: EdgeInsets.only(right: 10, top: 10),
            ),
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
