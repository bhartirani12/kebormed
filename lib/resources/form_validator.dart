import 'package:flutter/material.dart';

import 'resource.dart';

class FormValidator {
  BuildContext context;
  FormValidator(this.context);
  String? validateEmail(
    String? value,
  ) {
    final String input = value ?? '';
    if (input.trim().isEmpty) {
      return translate(
        context,
        StringKeys.emptyEmail,
      );
    }

    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(input)
        ? null
        : translate(
            context,
            StringKeys.invalidEmail,
          );
  }

  String? validatePassword(
    String? value,
  ) {
    final String input = value ?? '';
    if (input.trim().isEmpty) {
      return translate(
        context,
        StringKeys.emtryEntry,
      );
    }

    if (input.length < 6) {
      return translate(
        context,
        StringKeys.invalidPassword,
      );
    }
    return null;
  }
}
