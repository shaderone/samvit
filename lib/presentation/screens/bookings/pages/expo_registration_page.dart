import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:brechfete/presentation/screens/bookings/pages/pay_now_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ExpoRegistration extends StatelessWidget {
  static final formKey1 = GlobalKey<FormState>();
  const ExpoRegistration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      //if onWillPop is true, the route gets popped
      onWillPop: () async {
        final shouldPop = await shouldPopScreen(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
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
            key: formKey1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StickyHeader(
                  header: Container(
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
                        const SizedBox(height: 20),
                        CustomFormInput(
                          labelText: "Name",
                          textInputType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          hintText: "Enter institution name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            formKey1.currentState!.validate();
                          },
                        ),
                        CustomFormInput(
                          labelText: "Email",
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          hintText: "Enter email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            } else if (!EmailValidator.validate(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            formKey1.currentState!.validate();
                          },
                        ),
                        CustomFormInput(
                          labelText: "Phone",
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          hintText: "Enter phone",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Phone is required";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            formKey1.currentState!.validate();
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxInputLength: 10,
                          inputSpacing: 0,
                        ),
                        const SizedBox(height: 10),
                        CustomFormInput(
                          labelText: "Landline / other",
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          hintText: "Enter phone(other)",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Landline or other phone is required";
                            } else if (value.length > 11) {
                              return "Enter a valid phone number";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            formKey1.currentState!.validate();
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxInputLength: 11,
                          suffixIcon: MdiIcons.phoneClassic,
                        ),
                      ],
                    ),
                  ),
                ),
                StickyHeader(
                  header: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    padding: const EdgeInsets.all(15.0),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: bottomNavDark,
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
                        CustomFormInput(
                          labelText: "Name",
                          textInputType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          hintText: "Enter Faculty name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            formKey1.currentState!.validate();
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomFormInput(
                          labelText: "Email",
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          hintText: "Enter email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            } else if (!EmailValidator.validate(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            formKey1.currentState!.validate();
                          },
                        ),
                        CustomFormInput(
                          labelText: "Phone",
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          hintText: "Enter phone",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Phone is required";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            formKey1.currentState!.validate();
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxInputLength: 10,
                          inputSpacing: 0,
                        ),
                        const SizedBox(height: 10),
                        CustomFormInput(
                          labelText: "Landline / other",
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          hintText: "Enter phone(other)",
                          validator: (value) {
                            String patttern = r'(^(?:[+0]9)?[0-9]{10,11}$)';
                            RegExp regExp = RegExp(patttern);
                            if (value == null || value.isEmpty) {
                              return 'Phone is required';
                            } else if (!regExp.hasMatch(value)) {
                              return 'Please enter valid mobile number';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            formKey1.currentState!.validate();
                          },
                          maxInputLength: 11,
                          suffixIcon: MdiIcons.phoneClassic,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SlotButton(
                        buttonText: "Pay Later",
                        onPressed: () {
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
                      SlotButton(
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
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //phone validator, email validator, name validator

  Future<bool?> shouldPopScreen(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: primaryDark,
          title: const Text("Discard changes?"),
          titleTextStyle: const TextStyle(fontSize: 20),
          content: const Text("Any changes made will be lost"),
          contentTextStyle: const TextStyle(color: textWhiteShadeLight),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          actionsPadding: const EdgeInsets.only(right: 10),
          buttonPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                "No",
                style: TextStyle(
                  color: secondaryBlueShadeLight,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  const BorderSide(color: extraRed),
                ),
                backgroundColor: MaterialStateProperty.all(primaryDark),
              ),
              child: const Text(
                "Discard",
                style: TextStyle(
                  color: pureWhite,
                ),
              ),
            ),
          ],
        ),
      );
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
