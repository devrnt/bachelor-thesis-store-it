import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_it/src/models/store.dart';
import 'package:store_it/src/widgets/product/product_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Store>(
      builder: (context, model, child) {
        return ProductList(products: model.products);
      },
    );
  }
}
