import 'package:flutter/material.dart';
import 'package:store_it/src/models/product.dart';
import 'package:store_it/src/screens/details_screen.dart';
import 'package:store_it/src/widgets/product/product_item.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({@required this.products});

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? Container(
            child: Center(
              child: Text(
                'Geen producten gevonden',
                style: TextStyle(color: Theme.of(context).textTheme.title.color),
              ),
            ),
          )
        : ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(product: products[index]),
                        ));
                  },
                  child: ProductItem(product: products[index]),
                ),
              );
            },
          );
  }
}
