import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

class FormInputBuilder extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final Color focusedBorderColor;
  final bool autoFocus;
  const FormInputBuilder({
    Key? key,
    required this.controller,
    this.textInputAction = TextInputAction.next,
    required this.labelText,
    required this.hintText,
    required this.textInputType,
    this.focusedBorderColor = textWhiteShadeLight,
    this.suffixIcon,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autofocus: autoFocus,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          style: const TextStyle(
            color: textWhiteShadeDark,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: textWhiteShadeLight,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: strokeLight,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            labelText: labelText,
            floatingLabelStyle: const TextStyle(
              fontSize: 20,
              color: textWhiteShadeLight,
              fontWeight: FontWeight.normal,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: textWhiteShadeDark,
              fontSize: 16,
            ),
          ),
          //events and validations
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ],
    );
  }
}
