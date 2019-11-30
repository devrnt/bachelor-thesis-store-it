import 'package:flutter/material.dart';
import 'package:store_it/src/models/product.dart';
import 'package:store_it/src/widgets/store_it_button.dart';

class ProductItemLarge extends StatelessWidget {
  final Product product;
  static const assetPath = 'assets/images/product-image-placeholder.png';

  ProductItemLarge({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 15,
            offset: Offset(0, 10),
          )
        ],
      ),
      height: MediaQuery.of(context).size.height / 1.60,
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: SizedBox.expand(
              child: FadeInImage.assetNetwork(
                placeholder: assetPath,
                image: product.imageUrl,
                fit: BoxFit.fitWidth,
                fadeInDuration: const Duration(milliseconds: 350),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        '${product.title}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '${product.description}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Text(
                      '€${product.price}',
                      style: Theme.of(context).textTheme.body1.copyWith(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: StoreItButton(
                        text: 'Verwijder',
                        onPressed: () => print('delete product'),
                        backgroundColor:
                            Theme.of(context).highlightColor.withOpacity(0.20),
                        textColor: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
