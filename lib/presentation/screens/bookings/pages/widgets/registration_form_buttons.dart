import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:brechfete/presentation/screens/bookings/pages/pay_now_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationFormButtons extends StatelessWidget {
  const RegistrationFormButtons({
    Key? key,
    required this.formKey1,
    required this.screenWidth,
  }) : super(key: key);

  final GlobalKey<FormState> formKey1;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RegistrationButton(
            buttonText: "Pay Later",
            onPressed: () {
              print("pay later");
              if (formKey1.currentState!.validate()) {
                formKey1.currentState!.save();
                BookingScreen.isDateSelectedNotifier.value = false;
                BookingScreen.isTimeSelectedNotifier.value = false;
                Navigator.of(context).pushNamedAndRemoveUntil(
                  App.bookingSuccessRoute,
                  (route) => false,
                );
              }
            },
            screenWidth: screenWidth,
          ),
          RegistrationButton(
            buttonText: "Pay Now",
            onPressed: () {
              if (formKey1.currentState!.validate()) {
                formKey1.currentState!.save();
                BookingScreen.isDateSelectedNotifier.value = false;
                BookingScreen.isTimeSelectedNotifier.value = false;
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const PayNowPage(),
                  ),
                );
              }
            },
            bgColor: secondaryBlueShadeDark,
            screenWidth: screenWidth,
          ),
        ],
      ),
    );
  }
}

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
