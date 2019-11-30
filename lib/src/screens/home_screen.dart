import 'package:flutter/material.dart';
import 'package:store_it/src/blocs/bloc_provider.dart';
import 'package:store_it/src/blocs/store_bloc.dart';
import 'package:store_it/src/models/product.dart';
import 'package:store_it/src/widgets/product/product_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeBloc = BlocProvider.of<StoreBloc>(context);

    return StreamBuilder<List<Product>>(
      stream: storeBloc.products,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return ProductList(products: snapshot.data);
          default:
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
