import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormInput extends StatelessWidget {
  final double inputSpacing;
  final String labelText;
  final TextInputAction textInputAction;
  final String hintText;
  final bool obscureText;
  final int? maxInputLength;
  final TextInputType? textInputType;
  final IconData? suffixIcon;
  final AutovalidateMode autoValidateMode;
  final String? Function(String?) validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? suffixIconAction;
  const CustomFormInput({
    Key? key,
    required this.labelText,
    this.maxInputLength,
    required this.textInputType,
    this.suffixIcon,
    required this.validator,
    this.onChanged,
    required this.textInputAction,
    this.inputSpacing = 20,
    required this.hintText,
    this.obscureText = false,
    this.onSaved,
    this.inputFormatters,
    this.suffixIconAction,
    this.autoValidateMode = AutovalidateMode.disabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textWhiteShadeLight,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          autovalidateMode: autoValidateMode,
          maxLength: maxInputLength,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: textWhiteShadeDark,
          ),
          //common decoration
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: suffixIconAction,
              child: Icon(
                suffixIcon,
                color: textWhiteShadeLight,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
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
            hintText: hintText,
            hintStyle: const TextStyle(
              color: textWhiteShadeDark,
              fontWeight: FontWeight.normal,
            ),
          ),
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
        ),
        SizedBox(height: inputSpacing),
      ],
    );
  }
}
