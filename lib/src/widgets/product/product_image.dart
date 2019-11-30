import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String url;
  final BoxFit boxFit;

  ProductImage({@required this.url, this.boxFit = BoxFit.fitHeight});

  @override
  Widget build(BuildContext context) {
    const assetPath = 'assets/images/product-image-placeholder.png';

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: FadeInImage.assetNetwork(
          placeholder: assetPath,
          image: url,
          fit: boxFit,
          alignment: Alignment.center,
          fadeInDuration: const Duration(milliseconds: 350),
        ),
      ),
    );
  }
}
