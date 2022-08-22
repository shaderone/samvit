import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:brechfete/presentation/screens/bookings/pages/booking_success_page.dart';
import 'package:brechfete/presentation/screens/bookings/pages/pay_now_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ExpoRegistration extends StatelessWidget {
  const ExpoRegistration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          'Registration',
          style: GoogleFonts.ubuntu(
            fontSize: screenWidth <= 320 ? 20 : 24,
          ),
          colors: const [
            Color(0xFF6E6F71),
            Color(0xFFECECEC),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              GradientText(
                'Please fill out the form to book',
                style: GoogleFonts.ubuntu(
                  fontSize: 18.0,
                ),
                colors: const [
                  Color(0xFF6E6F71),
                  Color(0xFFECECEC),
                ],
              ),
              GradientText(
                'Expo slots',
                style: GoogleFonts.ubuntu(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
                colors: const [
                  Color(0xFF6E6F71),
                  Color(0xFFECECEC),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "INSTITUTION INFO",
                style: TextStyle(
                  color: secondaryBlueShadeLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Divider(
                color: textWhiteShadeLight,
                thickness: 1,
              ),
              CustomFormInput(
                labelText: "Name",
                textInputType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "phone number is required";
                  } else if (value.length != 10) {
                    return "Enter a valid 10-digit phone number";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                hintText: "Enter institution name",
              ),
              CustomFormInput(
                labelText: "Email or phone",
                textInputType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "phone number is required";
                  } else if (value.length != 10) {
                    return "Enter a valid 10-digit phone number";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                hintText: "Enter email or phone",
              ),
              CustomFormInput(
                labelText: "Phone(optional)",
                textInputType: TextInputType.name,
                validator: (value) {
                  //logic
                  return null;
                },
                textInputAction: TextInputAction.next,
                hintText: "Enter phone(optional)",
              ),
              const SizedBox(height: 10),
              const Text(
                "FACULTY INFO",
                style: TextStyle(
                  color: secondaryBlueShadeLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Divider(
                color: textWhiteShadeLight,
                thickness: 1,
              ),
              CustomFormInput(
                labelText: "Name",
                textInputType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "phone number is required";
                  } else if (value.length != 10) {
                    return "Enter a valid 10-digit phone number";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                hintText: "Enter institution name",
              ),
              CustomFormInput(
                labelText: "Email or phone",
                textInputType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "phone number is required";
                  } else if (value.length != 10) {
                    return "Enter a valid 10-digit phone number";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                hintText: "Enter email or phone",
              ),
              CustomFormInput(
                labelText: "Phone(optional)",
                textInputType: TextInputType.name,
                validator: (value) {
                  //logic
                  return null;
                },
                textInputAction: TextInputAction.next,
                hintText: "Enter phone(optional)",
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SlotButton(
                    buttonText: "Pay Later",
                    onPressed: () {
                      BookingScreen.isDateSelectedNotifier.value = false;
                      BookingScreen.isTimeSelectedNotifier.value = false;
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        App.bookingSuccessRoute,
                        (route) => false,
                      );
                    },
                  ),
                  SlotButton(
                    buttonText: "Pay Now",
                    onPressed: () {
                      BookingScreen.isDateSelectedNotifier.value = false;
                      BookingScreen.isTimeSelectedNotifier.value = false;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PayNowPage(),
                        ),
                      );
                    },
                    bgColor: secondaryBlueShadeDark,
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

//-------------------------validators--------------------//
  String? validateEmail(String? email) {
    RegExp regexEmail = RegExp(r'\w+@\w+\.\w+');
    if (email == null || email.isEmpty || !regexEmail.hasMatch(email)) {
      return "Email is required";
    } else if (!regexEmail.hasMatch(email)) {
      return "Oops! That doesn't look like a valid email";
    }
    return null;
  }

  void _doRegistration() {}
}

class SlotButton extends StatelessWidget {
  final String buttonText;
  final Color bgColor;
  final void Function()? onPressed;
  const SlotButton({
    Key? key,
    this.bgColor = primaryDarkShadeLight,
    this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
