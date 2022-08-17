import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

class CustomFormInput extends StatelessWidget {
  final double inputSpacing;
  final String labelText;
  final TextInputAction textInputAction;
  final String hintText;
  final bool obscureText;
  final int? maxInputLength;
  final TextInputType? textInputType;
  final IconData? suffixIcon;
  final String? Function(String?) validator;
  final void Function(String)? onChanged;
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

          maxLength: maxInputLength,
          keyboardType: textInputType,
          style: const TextStyle(
            //update this on user interaction
            fontWeight: FontWeight.bold,
            color: textWhiteShadeDark,
          ),
          //common decoration
          decoration: InputDecoration(
            suffixIcon: Icon(
              suffixIcon,
              color: textWhiteShadeLight,
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
            //labelText: "Phone",
            //floatingLabelStyle: const TextStyle(
            //  fontSize: 20,
            //  color: textWhiteShadeLight,
            //),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: textWhiteShadeDark,
              fontWeight: FontWeight.normal,
            ),
          ),
          //events and validations
          validator: validator,
          onChanged: onChanged,
          //make api call to check phone here, if it returns true, make the check mark visible with blue color, else display a message phone number not verified

          //on pressing login, user recieves OTP and enter it (autocomplete)

          //finally move to booking screen
        ),
        SizedBox(height: inputSpacing),
      ],
    );
  }
}
