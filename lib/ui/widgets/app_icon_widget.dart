import 'package:flutter/material.dart';

class AppIconWidget extends StatelessWidget {
  final String image;

  const AppIconWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    //getting screen size
    final size = MediaQuery.of(context).size;
    final bool portrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    //calculating container width
    final double imageSize = (portrait ? size.width : size.height) * 0.20;

    return Image.asset(
      image,
      height: imageSize,
    );
  }
}
