import 'package:flutter/material.dart';
import 'component/ProductItem.dart';
import 'component/ProductList.dart';
import 'models/product_model.dart';

void main() => runApp(
  MaterialApp(home: Scaffold(
  appBar: AppBar(
  backgroundColor: Colors.white, 
  centerTitle: true,             
  title: Text(
    'Products',
    style: TextStyle(color: Colors.black), 
  ),
  elevation: 0,                  
)
, body: ProductList()))
);

