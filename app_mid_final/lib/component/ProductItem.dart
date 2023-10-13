import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductItem extends StatelessWidget {
  final Products product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        height: 250,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.network(
                  product.thumbnail!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Color.fromARGB(255, 226, 240, 239),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.title.length > 20
                                  ? product.title.substring(0, 20) + '...'
                                  : product.title,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text('\ ${product.price} USD',style: TextStyle(fontWeight: FontWeight.bold),),
                          IconButton(
                            icon: Icon(Icons.remove_red_eye_sharp),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                    ),
                                    padding: EdgeInsets.all(16.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 150.0,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: product.images.length,
                                              itemBuilder: (ctx, index) {
                                                return Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: Image.network(product.images[index]),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          Text(product.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                                          Text(product.description!, style: TextStyle(fontSize: 14.0)),
                                          SizedBox(height: 8.0),
                                          Text('\$${product.price}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.star, color: Colors.yellow),
                                                  SizedBox(width: 4.0),
                                                  Text('${product.rating}'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.discount, color: Colors.blue),
                                                  SizedBox(width: 4.0),
                                                  Text('${product.discountPercentage}%'),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 16.0),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      Text(product.description!, style: TextStyle(fontSize: 14.0)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
