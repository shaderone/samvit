import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

class RegistrationButton extends StatelessWidget {
  final String buttonText;
  final Color bgColor;
  final void Function()? onPressed;
  final double screenWidth;
  const RegistrationButton({
    Key? key,
    this.bgColor = primaryDarkShadeLight,
    this.onPressed,
    required this.buttonText,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth <= 320
          ? 125
          : screenWidth <= 340
              ? 145
              : 160,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: screenWidth <= 320 ? 10 : 20,
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: screenWidth <= 320 ? 14 : 16),
          ),
        ),
      ),
    );
  }
}
