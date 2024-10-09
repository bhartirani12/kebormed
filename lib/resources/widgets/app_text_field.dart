import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resource.dart';

class AppTextFieldWidget extends StatefulWidget {
  final String inputPlaceHolder;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool hidden;
  final FormFieldValidator<String?> validator;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final ValueChanged<String?>? onChanged;
  final FilteringTextInputFormatter whitelistingTextInputFormatter;
  final bool readOnly;
  final bool enabled;
  final bool isPassword;

  const AppTextFieldWidget({
    super.key,
    required this.inputPlaceHolder,
    required this.controller,
    required this.inputType,
    required this.validator,
    required this.focusNode,
    required this.textInputAction,
    required this.whitelistingTextInputFormatter,
    this.enabled = true,
    this.hidden = false,
    this.readOnly = false,
    this.isPassword = false,
    this.onChanged,
  });

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.hidden;
  }

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: MarginKeys.inputFieldVerticalMargin * 1.5,
      ),
      constraints: const BoxConstraints(
        minHeight: 50,
      ),
      child: TextFormField(
        key: widget.key,
        readOnly: widget.readOnly,
        controller: widget.controller,
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary, fontSize: 16),
        cursorErrorColor: Theme.of(context).colorScheme.error,
        validator: widget.validator,
        cursorColor: Theme.of(context).colorScheme.primary,
        obscureText: _isObscured,
        enableInteractiveSelection: true,
        enabled: widget.enabled,
        inputFormatters: [
          widget.whitelistingTextInputFormatter,
        ],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: 'Enter ${widget.inputPlaceHolder}',
          hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.outline, fontSize: 16),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: BorderSideKeys.inputFieldBorderWidth,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: BorderSideKeys.inputFieldBorderWidth,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: BorderSideKeys.inputFieldBorderWidth,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: BorderSideKeys.inputFieldBorderWidth,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: BorderSideKeys.inputFieldBorderWidth,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          labelText: widget.inputPlaceHolder,
          labelStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryFixed,
                fontSize: 18,
              ),
          errorStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.error, fontSize: 15),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: _toggleVisibility,
                )
              : null,
        ),
        keyboardType: widget.inputType,
      ),
    );
  }
}
