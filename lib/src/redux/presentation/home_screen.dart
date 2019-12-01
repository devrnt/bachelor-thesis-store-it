import 'package:flutter/material.dart';
import 'package:store_it/src/redux/models/product.dart';
import 'package:store_it/src/widgets/product/product_list.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products;

  HomeScreen({@required this.products});

  @override
  Widget build(BuildContext context) {
    return ProductList(products: products);
  }
}
