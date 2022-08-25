import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:brechfete/presentation/screens/bookings/pages/booking_success_page.dart';
import 'package:brechfete/presentation/screens/bookings/pages/pay_now_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

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
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StickyHeader(
                header: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  padding: const EdgeInsets.all(15.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: bottomNavDark,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "INSTITUTION INFO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: secondaryBlueShadeLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        labelText: "Email",
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
                        hintText: "Enter email",
                      ),
                      CustomFormInput(
                        labelText: "Phone",
                        textInputType: TextInputType.name,
                        validator: (value) {
                          //logic
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        hintText: "Enter phone",
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomFormInput(
                      labelText: "Phone(other)",
                      textInputType: TextInputType.name,
                      validator: (value) {
                        //logic
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      hintText: "Enter phone(other)",
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              StickyHeader(
                header: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  padding: const EdgeInsets.all(15.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: bottomNavDark,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: const [
                      Text(
                        "FACULTY INFO",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: secondaryBlueShadeLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "(contact person from institution)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textWhiteShadeLight,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
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
                        hintText: "Enter Faculty name",
                      ),
                      const SizedBox(height: 10),
                      CustomFormInput(
                        labelText: "Email",
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
                        hintText: "Enter email",
                      ),
                      CustomFormInput(
                        labelText: "Phone",
                        textInputType: TextInputType.name,
                        validator: (value) {
                          //logic
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        hintText: "Enter phone",
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomFormInput(
                      labelText: "Phone(other)",
                      textInputType: TextInputType.name,
                      validator: (value) {
                        //logic
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      hintText: "Enter phone(other)",
                    ),
                    const SizedBox(height: 10),
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
                          screenWidth: screenWidth,
                        ),
                        SlotButton(
                          buttonText: "Pay Now",
                          onPressed: () {
                            BookingScreen.isDateSelectedNotifier.value = false;
                            BookingScreen.isTimeSelectedNotifier.value = false;
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => const PayNowPage(),
                              ),
                            );
                          },
                          bgColor: secondaryBlueShadeDark,
                          screenWidth: screenWidth,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlotButton extends StatelessWidget {
  final String buttonText;
  final Color bgColor;
  final void Function()? onPressed;
  final double screenWidth;
  const SlotButton({
    Key? key,
    this.bgColor = primaryDarkShadeLight,
    this.onPressed,
    required this.buttonText,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth <= 320 ? 125 : 160,
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
