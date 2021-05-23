import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_shopping/ProfileFile/sellerShop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' ;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:file_picker/file_picker.dart';

class addListing extends StatefulWidget {
  // final email;
  // final pass;
  // addListing({Key key,this.email,this.pass}) : super(key: key);
  @override
  _addListingState createState() => _addListingState();
}

class _addListingState extends State<addListing> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  String imageUrl;

  Future<File> imageFile;
  File _image1;
  File _image2;
  File _image3;

  String userEmail = "";
  Map data;
  File file;

  Future getImage(int type) async {
    PickedFile pickedImage = await ImagePicker().getImage(
        source: type == 1 ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50);
    return pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          iconTheme: new IconThemeData(color: Colors.grey[800], size: 27),
          backgroundColor: Colors.grey[300],
          elevation: 0,
          title: Center(
            child: Text(
              'Add Listing',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: ListView(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlineButton(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 2.5),
                              onPressed: () async {
                                // selectFile();
                              },
                              child: _displayChild2()),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlineButton(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 2.5),
                              onPressed: () async {
                                final tmpFile =  await getImage(1);
                                setState(() {
                                  imageFile =  tmpFile;
                                });
                                _selectImage(
                                    imageFile,
                                    2);
                              },
                              child: _displayChild2()),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlineButton(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 2.5),
                              onPressed: () async {
                                final tmpFile =  await getImage(1);
                                setState(() {
                                  imageFile =  tmpFile;
                                });
                                _selectImage(
                                    imageFile,
                                    3);
                              },
                              child: _displayChild3()),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Enter the product name with 10 characters maximum',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: productNameController,
                      decoration: InputDecoration(
                        hintText: 'Product name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: quantityController,
                      // initialValue: '1',
                      decoration: InputDecoration(
                        hintText: 'Quantity',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      // initialValue: '0.00',
                      controller: priceController,
                      decoration: InputDecoration(
                        hintText: 'Price',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: brandController,
                      decoration: InputDecoration(
                        hintText: 'Brand Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: categoryController,
                      decoration: InputDecoration(
                        hintText: 'Category Name',
                      ),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[300]),),
                    child: Text('Add Product'),
                    onPressed: () {
                      addData();
                    },
                  )
                ]),
        ));
  }

  void _selectImage(Future<File> pickImage, int imageNumber) async {
    File tempImg = await pickImage;
    switch (imageNumber) {
      case 1:
        setState(() {
          _image1 = tempImg;
        });
        break;
      case 2:
        setState(() {
          _image2 = tempImg;
        });
        break;
      case 3:
        setState(() {
          _image3 = tempImg;
        });
        break;
    }
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 50.0, 14.0, 50.0),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 50.0, 14.0, 50.0),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image2,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 50.0, 14.0, 50.0),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image3,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }


  void addData() async {

    Map<String,dynamic> demoData = {"Product Name" : productNameController.text,
      "Quantity" : quantityController.text,
      "Price" : priceController.text,
      "Brand" : brandController.text,
    "Category" : categoryController.text
    };
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    _firestore.collection('user').doc('test1234@gmail.com').collection('products').add(demoData);
  }

  // Future selectFile() async{
  //   // final result = await FilePicker.platform.pickFiles(allowMultiple: false);
  //
  //   if(result == null){
  //     return;
  //   }
  //   final path = result.files.single.path;
  //   setState(() {
  //     file = File(path);
  //   });
  //
  // }
}

