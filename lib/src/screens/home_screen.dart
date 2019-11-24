import 'package:flutter/material.dart';
import 'package:store_it/src/models/product.dart';
import 'package:store_it/src/widgets/product/product_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductList(products: initialProducts);
  }
}
