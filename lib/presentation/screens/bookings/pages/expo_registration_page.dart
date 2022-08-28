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
  final ValueNotifier<int> currentStepNotifier = ValueNotifier(0);
  bool isCompleted = false;

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
          //primary: false,
          child: Form(
            key: ExpoRegistration.formKey1,
            child: ValueListenableBuilder(
              valueListenable: currentStepNotifier,
              builder: (BuildContext context, int currentStep, Widget? _) {
                return Column(
                  children: [
                    Theme(
                      data: ThemeData.dark(),
                      child: Stepper(
                        controlsBuilder:
                            (context, ControlsDetails actionButtons) {
                          if (currentStep == 2) {
                            return Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          primaryDark,
                                        ),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: const BorderSide(
                                              color: strokeLight,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: actionButtons.onStepCancel,
                                      child: const Text(
                                        "Edit again",
                                        style: TextStyle(
                                          color: textWhiteShadeLight,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        secondaryBlueShadeDark,
                                      ),
                                    ),
                                    onPressed: actionButtons.onStepContinue,
                                    child: Text(
                                      currentStep == 1 ? "Pay Fee" : "Continue",
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                if (currentStep != 0)
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          bgDark,
                                        ),
                                      ),
                                      onPressed: actionButtons.onStepCancel,
                                      child: const Text("previous"),
                                    ),
                                  ),
                              ],
                            );
                          }
                        },
                        currentStep: currentStep,
                        onStepContinue: () {
                          final bool isAtLastStep = currentStep == 2;
                          if (isAtLastStep) {
                            print("nulldone");
                            setState(() {
                              isCompleted = true;
                            });
                            //send data
                          } else {
                            currentStepNotifier.value += 1;
                          }
                        },
                        onStepCancel: currentStep == 0
                            ? null
                            : () {
                                setState(() {
                                  isCompleted = false;
                                });
                                currentStepNotifier.value -= 1;
                                print(currentStep);
                                //if (currentStep == 1) {
                                //}
                              },
                        steps: [
                          Step(
                            state: currentStep > 0
                                ? StepState.complete
                                : StepState.editing,
                            isActive: currentStep > 0,
                            title: const Text(
                              "INSTITUTION INFO",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: secondaryBlueShadeLight,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            content: RegistrationFormHolder(
                              formKey1: ExpoRegistration.formKey1,
                              isInstitution: true,
                            ),
                          ),
                          Step(
                            state: currentStep > 0
                                ? StepState.complete
                                : StepState.editing,
                            isActive: currentStep > 1,
                            title: const Text(
                              "FACULTY INFO",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: secondaryBlueShadeLight,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            content: RegistrationFormHolder(
                              formKey1: ExpoRegistration.formKey1,
                              isInstitution: false,
                            ),
                          ),
                          Step(
                            state: StepState.complete,
                            isActive: currentStep > 1,
                            title: const Text("complete"),
                            content: const SizedBox(),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        ColoredBox(
                          color: primaryDark,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
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
                        const SizedBox(height: 20),
                        RegistrationFormButtons(
                          formKey1: ExpoRegistration.formKey1,
                          screenWidth: screenWidth,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
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
