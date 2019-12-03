import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String url;
  final BoxFit boxFit;

  ProductImage({@required this.url, this.boxFit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    const assetPath = 'assets/images/product-image-placeholder.png';

    return Container(
      color: Colors.white,
      height: 87,
      width: 87,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
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
