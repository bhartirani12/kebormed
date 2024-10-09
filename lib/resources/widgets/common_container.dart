import 'package:flutter/material.dart';

import '../margin_keys.dart';

class CommonContainer extends StatelessWidget {
  final Widget child;

  const CommonContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(MarginKeys.commonPadding),
      margin: const EdgeInsets.all(MarginKeys.dialogBoxContentMargin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(MarginKeys.bodyCommonVerticalMargin),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: MarginKeys.dialogBoxContentMargin,
            spreadRadius: MarginKeys.commonSpreadRadius,
          ),
        ],
      ),
      child: child,
    );
  }
}
