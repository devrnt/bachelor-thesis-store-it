import 'package:flutter/material.dart';
import 'package:store_it/src/models/product.dart';
import 'package:store_it/src/widgets/product/product_item_large.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  static const assetPath = 'assets/images/product-image-placeholder.png';

  DetailsScreen({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).textTheme.title.color),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Details',
            style: TextStyle(
              color: Theme.of(context).textTheme.title.color,
              fontSize: 22.0,
              fontFamily: 'Asap',
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 22.0),
        child: ProductItemLarge(product: product),
      ),
    );
  }
}
