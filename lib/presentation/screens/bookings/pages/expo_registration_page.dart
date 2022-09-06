import 'dart:convert';
import 'dart:developer';

import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:brechfete/presentation/screens/bookings/pages/booking_success_page.dart';
import 'package:brechfete/presentation/screens/bookings/pages/pay_now_page.dart';
import 'package:brechfete/presentation/screens/bookings/pages/widgets/registration_form_builder.dart';
import 'package:brechfete/presentation/screens/bookings/pages/widgets/registration_form_buttons.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/slot_status_widgets/slot_info_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:http/http.dart' as http;

class ExpoRegistration extends StatefulWidget {
  const ExpoRegistration({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpoRegistration> createState() => _ExpoRegistrationState();
}

ValueNotifier<bool> isValidatedNotifier = ValueNotifier(false);

class _ExpoRegistrationState extends State<ExpoRegistration> {
  ValueNotifier<int> currentStepNotifier = ValueNotifier(0);

  bool isSecondStepValidated = false;

  // ignore: unused_field
  late BuildContext _registrationFormContext;

  void _manageRegistrationFormContext(BuildContext newValue) {
    setState(() {
      _registrationFormContext = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ValueListenableBuilder(
        valueListenable: isRegistrationSuccessNotifier,
        builder: (BuildContext context, bool isRegistered, Widget? _) {
          return WillPopScope(
            //if onWillPop is true, the route gets popped
            onWillPop: () async {
              final shouldPop = await showCustomAlertDialog(
                context,
                "Discard Changes?",
                "Any Changes Made will be lost",
                "No",
                "Discard",
                extraRed,
                primaryDark,
              );
              if (shouldPop != null && shouldPop) {
                BookingScreen.isDateSelectedNotifier.value = false;
                BookingScreen.isTimeSelectedNotifier.value = false;
                SlotInputItem.isSlotCountValidatedNotifier.value = false;
                isRegistrationSuccessNotifier.value = false;
                currentStepNotifier.value = 0;
                isValidatedNotifier.value = false;
              }
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
                child: ValueListenableBuilder(
                  valueListenable: currentStepNotifier,
                  builder: (BuildContext context, int currentStep, Widget? _) {
                    const firstStep = 0, secondStep = 1, thirdStep = 2;
                    return Theme(
                      data: ThemeData.dark(),
                      child: Column(
                        children: [
                          Stepper(
                            currentStep: currentStep,
                            onStepContinue: !isValidatedNotifier.value
                                ? () {
                                    final showWarning = SnackBar(
                                      backgroundColor: primaryDark,
                                      content: Text(
                                        'Please fill all the fields!',
                                        style: GoogleFonts.poppins(
                                          color: extraRed,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      action: SnackBarAction(
                                        label: 'OK',
                                        onPressed: () {}, //close
                                        textColor: secondaryBlueShadeLight,
                                      ),
                                    );

                                    // Find the ScaffoldMessenger in the widget tree
                                    // and use it to show a SnackBar.
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(showWarning);
                                  }
                                : () => onStepContinue(currentStep),
                            onStepCancel: () => onStepCancel(currentStep),
                            controlsBuilder: (context, buttonActions) {
                              return StepperActions(
                                buttonActions: buttonActions,
                                currentStep: currentStep,
                                isLastStep:
                                    currentStep == thirdStep ? true : false,
                              );
                            },
                            physics: const ClampingScrollPhysics(),
                            steps: buildSteps(
                                currentStep, firstStep, secondStep, thirdStep),
                          ),
                          ValueListenableBuilder(
                              valueListenable: isRegistrationSuccessNotifier,
                              builder: (BuildContext context, bool isRegistered,
                                  Widget? _) {
                                return Visibility(
                                  //should only be visible if doRegister is successful
                                  visible: isRegistered ? true : false,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ColoredBox(
                                              color: primaryDark,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Text(
                                                  "Please select a payment option to continue",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: textWhiteShadeLight,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RegistrationButton(
                                            buttonText: "Pay Later",
                                            screenWidth: screenWidth,
                                            onPressed: onPayLaterPressed,
                                          ),
                                          const SizedBox(width: 10),
                                          RegistrationButton(
                                            buttonText: "Pay Now",
                                            screenWidth: screenWidth,
                                            bgColor: secondaryBlueShadeDark,
                                            onPressed: onPayNowPressed,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }

  List<Step> buildSteps(
      int currentStep, int firstStep, int secondStep, int thirdStep) {
    return [
      Step(
        state: currentStep > firstStep
            ? StepState.complete
            : currentStep == firstStep
                ? StepState.editing
                : StepState.disabled,
        isActive: currentStep >= firstStep ? true : false,
        title: Text(
          "INSTITUTION INFO",
          style: currentStep > firstStep
              ? const TextStyle(
                  color: secondaryBlueShadeLight,
                  fontWeight: FontWeight.bold,
                )
              : null,
        ),
        content: RegistrationFormHolder(
          isInstitution: true,
          sendContext: _manageRegistrationFormContext,
        ),
      ),
      Step(
        state: currentStep > secondStep
            ? StepState.complete
            : currentStep == secondStep
                ? StepState.editing
                : StepState.disabled,
        isActive: currentStep >= secondStep ? true : false,
        title: Text(
          "FACULTY INFO",
          style: currentStep > secondStep
              ? const TextStyle(
                  color: secondaryBlueShadeLight,
                  fontWeight: FontWeight.bold,
                )
              : null,
        ),
        content: RegistrationFormHolder(
          isInstitution: false,
          sendContext: _manageRegistrationFormContext,
        ),
      ),
      Step(
        state:
            currentStep == thirdStep ? StepState.complete : StepState.disabled,
        isActive: currentStep == thirdStep ? true : false,
        title: Text(
          "FINISH",
          style: currentStep > secondStep
              ? const TextStyle(
                  color: secondaryBlueShadeLight,
                  fontWeight: FontWeight.bold,
                )
              : null,
        ),
        content: const SizedBox(),
      ),
    ];
  }

  void onStepContinue(int currentStep) {
    if (isValidatedNotifier.value) {
      currentStepNotifier.value += 1;
      //reseting for next field and checking whether secondField is validated or not to see if it should undergo validation in the next step
      if (currentStep == 0 && isSecondStepValidated) {
        isValidatedNotifier.value = true;
      } else {
        isValidatedNotifier.value = false;
      }
    }
  }

  void onStepCancel(int currentStep) {
    if (currentStep == 1) {
      setState(() {
        isValidatedNotifier.value
            ? isSecondStepValidated = true
            : isSecondStepValidated = false;
      });
    }
    isValidatedNotifier.value = true;
    currentStepNotifier.value -= 1;
  }

  void onPayLaterPressed() async {
    final shouldProceed = await showCustomAlertDialog(
      context,
      "Are you sure?",
      "Selected : Pay Later",
      "No",
      "Proceed",
      Colors.transparent,
      secondaryBlueShadeDark,
    );
    BookingScreen.isDateSelectedNotifier.value = false;
    BookingScreen.isTimeSelectedNotifier.value = false;
    if (!mounted) {
      return;
    }
    if (shouldProceed ?? false) {
      isRegistrationSuccessNotifier.value = false;
      //new reset
      isValidatedNotifier.value = false;
      SlotInputItem.isSlotCountValidatedNotifier.value = false;

      //send request
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");
      final regId = prefs.getString("regToken");
      EasyLoading.instance.textColor = secondaryBlueShadeLight;
      EasyLoading.show(
        status: 'processing...',
      );
      var client = http.Client();
      var response = await client.post(
        Uri.parse(
          "$baseURL/payment/",
        ),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token $token"
        },
        body: jsonEncode(
          {
            "collegeid": regId,
            "type": "pl",
          },
        ),
      );
      EasyLoading.dismiss();
      //log(response.body.toString());
      final data = jsonDecode(response.body);

      if (data['is_booked']) {
        if (!mounted) return;
        Navigator.of(context).pushNamedAndRemoveUntil(
          App.bookingSuccessRoute,
          (route) => false,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Unable to confirm booking!",
          textColor: extraRed,
        );
      }
    }
  }

  void onPayNowPressed() async {
    final shouldProceed = await showCustomAlertDialog(
      context,
      "Are you sure?",
      "Selected : Pay Now",
      "No",
      "Proceed",
      Colors.transparent,
      secondaryBlueShadeDark,
    );
    BookingScreen.isDateSelectedNotifier.value = false;
    BookingScreen.isTimeSelectedNotifier.value = false;
    if (!mounted) {
      return;
    }
    if (shouldProceed ?? false) {
      //send registration data to backend
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => const PayNowPage(),
        ),
      );
    }
  }
}

Future<bool?> showCustomAlertDialog(
  BuildContext context,
  String heading,
  String subHeading,
  String subText,
  String mainText,
  Color borderColor,
  Color backgroundColor,
) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      backgroundColor: primaryDark,
      insetPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      title: Text(heading),
      titleTextStyle: const TextStyle(fontSize: 20),
      content: Text(subHeading),
      contentTextStyle: const TextStyle(color: textWhiteShadeLight),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      actionsPadding: const EdgeInsets.only(right: 10),
      buttonPadding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            subText,
            style: const TextStyle(
              color: secondaryBlueShadeLight,
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            //print(
            //    "${subHeading.split(" ")[2] + subHeading.split(" ")[3]} succeess");
            Navigator.of(context).pop(true);
          },
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(color: borderColor),
            ),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
          ),
          child: Text(
            mainText,
            style: const TextStyle(
              color: pureWhite,
            ),
          ),
        ),
      ],
    ),
  );
}

class StepperActions extends StatelessWidget {
  final int currentStep;
  final bool isLastStep;
  final ControlsDetails buttonActions;
  const StepperActions({
    Key? key,
    required this.buttonActions,
    required this.currentStep,
    required this.isLastStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: isRegistrationSuccessNotifier,
              builder: (BuildContext context, bool isRegistered, Widget? _) {
                return ElevatedButton(
                  onPressed: currentStep == 2
                      ? isRegistered
                          ? null
                          : () async {
                              // call doRegister in registrationform
                              final isRegistrationSuccess =
                                  await RegistrationFormHolderState
                                      .doRegistration();

                              if (isRegistrationSuccess) {
                                Fluttertoast.showToast(
                                  msg: "Success, proceed with payment",
                                  textColor: extraGreen,
                                  toastLength: Toast.LENGTH_LONG,
                                );
                              }
                            }
                      : buttonActions.onStepContinue,
                  child: Text(isLastStep ? "Register" : "Next"),
                );
              }),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: isRegistrationSuccessNotifier,
              builder: (BuildContext context, bool isRegistered, Widget? _) {
                return ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(bgDark),
                      side: MaterialStateProperty.all(
                        const BorderSide(
                          color: textWhiteShadeDark,
                        ),
                      )),
                  onPressed: currentStep == 0 || isRegistered
                      ? null
                      : buttonActions.onStepCancel,
                  child: Text(isLastStep ? "Edit again" : "Previous"),
                );
              }),
        ),
      ],
    );
  }
}
