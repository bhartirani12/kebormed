import 'package:flutter/material.dart';

class MarginKeys {
  static const double inputFieldVerticalMargin = 14;
  static const double bodyCommonVerticalMargin = 10;
  static const double bodyCommonTopMargin = 100;
  static const double dialogBoxContentMargin = 5;
  static const double commonContainerPadding = 30;
  static const double commonPadding = 16;
  static const double commonSpreadRadius = 1;

  static SizedBox spacer(
    final double space,
  ) =>
      SizedBox(
        height: space,
      );
}

class BorderSideKeys {
  static const double inputFieldBorderWidth = 0.6;
}

class AppBorderRadius {
  static const commonButtonRadius = BorderRadius.all(
    Radius.circular(
      5,
    ),
  );
}
