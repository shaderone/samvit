import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/bookings/pages/widgets/registration_form_buttons.dart';
import 'package:brechfete/presentation/screens/bookings/pages/widgets/registration_form_holder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ExpoRegistration extends StatefulWidget {
  static final formKey1 = GlobalKey<FormState>();

  const ExpoRegistration({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpoRegistration> createState() => _ExpoRegistrationState();
}

class _ExpoRegistrationState extends State<ExpoRegistration> {
  ValueNotifier<int> currentStepNotifier = ValueNotifier(0);
  final _institutionKey = GlobalKey<FormState>();
  final _facultyKey = GlobalKey<FormState>();

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
                      onStepContinue: onStepContinue,
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
        content: InstitutionFormHolder(
          institutionFormKey: _institutionKey,
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
        content: FacultyFormHolder(
          facultyFormKey: _facultyKey,
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

  void onStepContinue() {
    currentStepNotifier.value += 1;
  }

  void onStepCancel() {
    currentStepNotifier.value -= 1;
  }

  void onPayLaterPressed() {
    print("show popup and confirm");
    showCustomAlertDialog(context, "Pay Later");
  }

  void onPayNowPressed() {
    print("go to payment mode and book");
    showCustomAlertDialog(context, "Pay Now");
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

showCustomAlertDialog(BuildContext context, String paymentOption) {
  showDialog(
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
            Navigator.of(context).pop();
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
            Navigator.of(context).pop();
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
