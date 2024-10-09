import 'package:flutter/material.dart';
import 'package:kebormed/resources/resource.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const CommonButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(
          top: MarginKeys.inputFieldVerticalMargin,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: AppBorderRadius.commonButtonRadius,
        ),
        width: double.infinity,
        child: body(
          context: context,
        ),
      ),
    );
  }

  Widget body({
    required final BuildContext context,
  }) {
    return Padding(
        padding: const EdgeInsets.all(
          MarginKeys.bodyCommonVerticalMargin,
        ),
        child: Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            )));
  }
}
