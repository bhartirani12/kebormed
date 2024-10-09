import 'package:flutter/material.dart';

TextTheme appTextTheme(BuildContext context) => Theme.of(context).textTheme;

abstract class TextStyles {
  static const listItemLableStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );

  static const fieldTitleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
  );
}
