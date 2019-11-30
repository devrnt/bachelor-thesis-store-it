import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String url;
  final BoxFit boxFit;

  ProductImage({@required this.url, this.boxFit = BoxFit.scaleDown});

  @override
  Widget build(BuildContext context) {
    const assetPath = 'assets/images/product-image-placeholder.png';

    return ClipOval(
      child: Container(
        color: Colors.white,
        height: 100,
        width: 100,
        child: ClipOval(
          child: FadeInImage.assetNetwork(
            placeholder: assetPath,
            image: url,
            fit: boxFit,
            alignment: Alignment.center,
            fadeInDuration: const Duration(milliseconds: 350),
          ),
        ),
      ),
    );
  }
}
