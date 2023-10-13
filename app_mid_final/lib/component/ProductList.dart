import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product_model.dart';
import 'ProductItem.dart';
class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Future<List<Products>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['products'] as List;
      List<Products> productsList = data.map((i) => Products.fromJson(i)).toList();
      return productsList;
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Products>>(
      future: fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ProductItem(product: snapshot.data![index]);
            },
          );
        }
      },
    );
  }
}
