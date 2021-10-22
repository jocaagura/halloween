import 'package:flutter/material.dart';

class ImageAssetPositionedWidget extends StatelessWidget {
  const ImageAssetPositionedWidget({
    Key? key,
    required this.sizeAsset,
    required this.top,
    required this.left,
    required this.assetImage,
  }) : super(key: key);

  final double sizeAsset;
  final double top;
  final double left;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeAsset,
      height: sizeAsset,
      margin: EdgeInsets.only(top: top, left: left),
      child: Image.asset(
        assetImage,
        fit: BoxFit.contain,
      ),
    );
  }
}
