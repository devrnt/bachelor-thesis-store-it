import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:store_it/src/mobx/store/product_store.dart';
import 'package:store_it/src/widgets/product/product_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productStore = Provider.of<ProductStore>(context);

    return Observer(
      builder: (context) {
        return ProductList(products: productStore.products);
      },
    );
  }
}
