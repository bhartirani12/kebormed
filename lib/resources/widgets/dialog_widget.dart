import 'package:flutter/material.dart';
import '../resource.dart';

class DialogWidget {
  static showDialogBox({
    required BuildContext context,
    required String message,
    required bool isError,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MarginKeys().spacer(MarginKeys.commonPadding),
                Text(
                  translate(
                        context,
                        isError ? StringKeys.error : StringKeys.success,
                      ) ??
                      '',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: isError
                          ? Theme.of(context).colorScheme.onErrorContainer
                          : Theme.of(context).colorScheme.primaryContainer,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                MarginKeys().spacer(
                  MarginKeys.commonPadding,
                ),
                Text(
                  message,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: isError
                          ? Theme.of(context).colorScheme.onErrorContainer
                          : Theme.of(context).colorScheme.primaryContainer,
                      fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 100,
                  child: CommonButton(
                    label: translate(
                          context,
                          StringKeys.okay,
                        ) ??
                        '',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                MarginKeys().spacer(
                  MarginKeys.commonPadding,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
