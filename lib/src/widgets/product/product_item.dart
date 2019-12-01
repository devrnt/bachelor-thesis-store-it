import 'package:flutter/material.dart';
import 'package:store_it/src/redux/models/product.dart';
import 'package:store_it/src/widgets/product/product_image.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 150.0;

    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 40.0),
        height: itemHeight,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 7,
              child: SizedBox.expand(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            '${product.title}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                        Text(
                          '${product.description}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    Text(
                      '€${product.price}',
                      style: Theme.of(context).textTheme.body1.copyWith(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: ProductImage(url: product.imageUrl),
            ),
          ],
        ),
      ),
    );
  }
}
