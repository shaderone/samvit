import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:brechfete/presentation/screens/bookings/pages/pay_now_page.dart';
import 'package:brechfete/presentation/screens/bookings/pages/widgets/registration_form_buttons.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../booking_screen.dart';

class ExpoRegistration extends StatefulWidget {
  static final formKey1 = GlobalKey<FormState>();

  const ExpoRegistration({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpoRegistration> createState() => _ExpoRegistrationState();
}

ValueNotifier<bool> isValidatedNotifier = ValueNotifier(false);

class _ExpoRegistrationState extends State<ExpoRegistration> {
  ValueNotifier<int> currentStepNotifier = ValueNotifier(0);
  ValueNotifier<bool> institutionAutoValidateNotifier = ValueNotifier(false);
  ValueNotifier<bool> facultyAutoValidateNotifier = ValueNotifier(false);

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
                          : () => onStepContinue(
                              currentStep, firstStep, secondStep, thirdStep),
                      onStepCancel: onStepCancel,
                      controlsBuilder: (context, buttonActions) {
                        return StepperActions(
                          buttonActions: buttonActions,
                          currentStep: currentStep,
                          isLastStep: currentStep == thirdStep ? true : false,
                        );
                      },
                      physics: const ClampingScrollPhysics(),
                      steps: buildSteps(
                          currentStep, firstStep, secondStep, thirdStep),
                    ),
                    Visibility(
                      visible: currentStep == thirdStep ? true : false,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ColoredBox(
                                  color: primaryDark,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
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
        content: ValueListenableBuilder(
          valueListenable: institutionAutoValidateNotifier,
          builder: (BuildContext context, bool shouldAutoValidate, Widget? _) {
            return InstitutionFormHolder(
              autoValidate: shouldAutoValidate,
            );
          },
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
        content: ValueListenableBuilder(
          valueListenable: facultyAutoValidateNotifier,
          builder: (BuildContext context, bool shouldAutoValidate, Widget? _) {
            return InstitutionFormHolder(
              autoValidate: shouldAutoValidate,
            );
          },
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

  void onStepContinue(
      int currentStep, int firstStep, int secondStep, int thirdStep) {
    if (currentStep == firstStep) {
      final isValidated = isValidatedNotifier.value;
      if (isValidated) {
        currentStepNotifier.value += 1;
      } else {
        institutionAutoValidateNotifier.value = true;
      }
      isValidatedNotifier.value =
          !isValidatedNotifier.value ? false : true; //reseting for next field
    } else if (currentStep == secondStep) {
      final isValidated = isValidatedNotifier.value;
      if (isValidated) {
        currentStepNotifier.value += 1;
      } else {
        facultyAutoValidateNotifier.value = true;
      }
      isValidatedNotifier.value = false; //reseting for next field
    }
  }

  void onStepCancel() {
    //facultyAutoValidateNotifier.value = false;
    //institutionAutoValidateNotifier.value = false;
    //validate this based on currentstep like above
    isValidatedNotifier.value = true; //
    currentStepNotifier.value -= 1;
  }

  void onPayLaterPressed() async {
    print("show popup and confirm");
    final shouldProceed = await showCustomAlertDialog(context, "Pay Later");
    BookingScreen.isDateSelectedNotifier.value = false;
    BookingScreen.isTimeSelectedNotifier.value = false;
    if (!mounted) {
      return;
    }
    if (shouldProceed ?? false) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        App.bookingSuccessRoute,
        (route) => false,
      );
    }
  }

  void onPayNowPressed() async {
    print("go to payment mode and book");
    final shouldProceed = await showCustomAlertDialog(context, "Pay Now");
    BookingScreen.isDateSelectedNotifier.value = false;
    BookingScreen.isTimeSelectedNotifier.value = false;
    if (!mounted) {
      return;
    }
    if (shouldProceed ?? false) {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => const PayNowPage(),
        ),
      );
    }
  }

  Future<bool?> shouldPopScreen(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: primaryDark,
        title: const Text("Discard changes?"),
        titleTextStyle: const TextStyle(fontSize: 20),
        content: const Text("Any changes made will be lost"),
        contentTextStyle: const TextStyle(color: textWhiteShadeLight),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        actionsPadding: const EdgeInsets.only(right: 10),
        buttonPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
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
        Visibility(
          visible: isLastStep ? false : true,
          child: Expanded(
            child: ElevatedButton(
              onPressed: buttonActions.onStepContinue,
              child: const Text("Next"),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(bgDark),
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: textWhiteShadeDark,
                  ),
                )),
            onPressed: currentStep == 0 ? null : buttonActions.onStepCancel,
            child: Text(isLastStep ? "Edit again" : "Previous"),
          ),
        ),
      ],
    );
  }
}

Future<bool?> showCustomAlertDialog(
    BuildContext context, String paymentOption) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: primaryDark,
      title: const Text("Are you sure?"),
      titleTextStyle: const TextStyle(fontSize: 20),
      content: Text("Selected : $paymentOption"),
      contentTextStyle: const TextStyle(color: textWhiteShadeLight),
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
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
          child: const Text(
            "No",
            style: TextStyle(
              color: secondaryBlueShadeLight,
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            print("$paymentOption succeess");
            Navigator.of(context).pop(true);
          },
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(color: Colors.transparent),
            ),
            backgroundColor: MaterialStateProperty.all(secondaryBlueShadeDark),
          ),
          child: const Text(
            "Proceed",
            style: TextStyle(
              color: pureWhite,
            ),
          ),
        ),
      ],
    ),
  );
}

class InstitutionFormHolder extends StatefulWidget {
  final bool autoValidate;
  const InstitutionFormHolder({
    Key? key,
    required this.autoValidate,
  }) : super(key: key);

  @override
  State<InstitutionFormHolder> createState() => _InstitutionFormHolderState();
}

class _InstitutionFormHolderState extends State<InstitutionFormHolder> {
  final _institutionKey = GlobalKey<FormState>();
  bool isTelephoneSwitched = false;
  late bool autoValidate;

  @override
  void initState() {
    super.initState();
    autoValidate = widget.autoValidate;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _institutionKey,
      onChanged: () {
        if (_institutionKey.currentState!.validate()) {
          print("success");
          //_institutionKey.currentState!.save();
          //return true to validate insittution
          isValidatedNotifier.value = true;
        } else {
          print("failed");
          //return false to validate insittution
          isValidatedNotifier.value = false;

          //Also disable the next button if not
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFormInput(
            autoValidateMode: autoValidate
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            labelText: "Name",
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText: "Enter Institution name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Name is required";
              }
              return null;
            },
          ),
          CustomFormInput(
            autoValidateMode: autoValidate
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            labelText: "Email",
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            hintText: "Enter Institution email",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              } else if (!EmailValidator.validate(value)) {
                return "Enter a valid email";
              }
              return null;
            },
          ),
          CustomFormInput(
            autoValidateMode: autoValidate
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            labelText: "Phone",
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            hintText: "Enter Institution phone",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Phone is required";
              }
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxInputLength: 10,
            inputSpacing: 0,
          ),
          const SizedBox(height: 10),
          CustomFormInput(
            autoValidateMode: autoValidate
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            labelText: "Landline / other",
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            hintText: "Enter ${isTelephoneSwitched ? "Phone" : "Landline"}",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Institution Landline/phone is required";
              } else if (value.length > 11) {
                return "Enter a valid phone number";
              }
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxInputLength: isTelephoneSwitched ? 10 : 11,
            suffixIcon: isTelephoneSwitched
                ? Icons.phone_android_rounded
                : MdiIcons.phoneClassic,
            suffixIconAction: () {
              setState(() {
                isTelephoneSwitched = !isTelephoneSwitched;
              });
            },
            inputSpacing: 0,
          ),
        ],
      ),
    );
  }
}

class FacultyFormHolder extends StatefulWidget {
  const FacultyFormHolder({
    Key? key,
  }) : super(key: key);

  @override
  State<FacultyFormHolder> createState() => _FacultyFormHolderState();
}

class _FacultyFormHolderState extends State<FacultyFormHolder> {
  final _facultyKey = GlobalKey<FormState>();
  bool isTelephoneSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _facultyKey,
      onChanged: () {
        if (_facultyKey.currentState!.validate()) {
          print("success");
          //_institutionKey.currentState!.save();
          //return true to validate insittution
          isValidatedNotifier.value = true;
        } else {
          print("failed");
          //return false to validate insittution
          isValidatedNotifier.value = false;

          //Also disable the next button if not
        }
      },
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
          ),
          CustomFormInput(
            labelText: "Email",
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            hintText: "Enter Faculty email",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              } else if (!EmailValidator.validate(value)) {
                return "Enter a valid email";
              }
              return null;
            },
          ),
          CustomFormInput(
            labelText: "Phone",
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            hintText: "Enter Faculty phone",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Phone is required";
              }
              return null;
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
            hintText: "Enter ${isTelephoneSwitched ? "Phone" : "Landline"}",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Faculty Landline/phone is required";
              } else if (value.length > 11) {
                return "Enter a valid phone number";
              }
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxInputLength: isTelephoneSwitched ? 10 : 11,
            suffixIcon: isTelephoneSwitched
                ? Icons.phone_android_rounded
                : MdiIcons.phoneClassic,
            suffixIconAction: () {
              setState(() {
                isTelephoneSwitched = !isTelephoneSwitched;
              });
            },
            inputSpacing: 0,
          ),
        ],
      ),
    );
  }
}
