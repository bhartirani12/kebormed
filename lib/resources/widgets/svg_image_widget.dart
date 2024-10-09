import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImageWidget extends StatelessWidget {
  final String assetImage;
  final double width;
  final double height;
  final BoxFit fit;

  const SvgImageWidget({
    super.key,
    required this.assetImage,
    required this.width,
    required this.height,
    this.fit = BoxFit.fitWidth,
  });
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetImage,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
