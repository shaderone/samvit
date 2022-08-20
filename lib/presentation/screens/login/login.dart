import 'dart:async';

import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.pulse
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = textWhiteShadeLight
    ..backgroundColor = primaryDark
    ..indicatorColor = textWhiteShadeLight
    ..textColor = pureWhite
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..userInteractions = false;
  //..customAnimation = CustomAnimation();
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String phone = '';
  String password = '';
  bool obscureText = true;
  bool isButtonActive = false;
  bool isAbsorbing = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  //flutter_easyloading variables
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    //EasyLoading.showSuccess('Use in initState');
    // EasyLoading.removeCallbacks();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: hideKeyboard,
          child: AbsorbPointer(
            absorbing: isAbsorbing,
            child: SingleChildScrollView(
              reverse: true,
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Samvit",
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset("assets/images/logo.png"),
                    const SizedBox(height: 50),
                    CustomFormInput(
                      labelText: "Phone",
                      hintText: 'Enter your phone number',
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                      maxInputLength: 10,
                      inputSpacing: 0,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      autoValidateMode: autovalidateMode,
                      onSaved: (String? value) {
                        phone = value!;
                      },
                      onChanged: (value) {
                        if (value.length == 10 &&
                            formKey.currentState!.validate()) {
                          setState(() {
                            isButtonActive = true;
                          });
                        }
                        //} else {
                        //  formKey.currentState!.validate();
                        //  setState(() {
                        //    isButtonActive = false;
                        //  });
                        //}
                        if (autovalidateMode ==
                            AutovalidateMode.onUserInteraction) {
                          formKey.currentState!.validate();
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            setState(() {
                              isButtonActive = true;
                            });
                          } else {
                            setState(() {
                              isButtonActive = false;
                            });
                          }
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "phone number is required";
                        } else if (value.length != 10) {
                          return "Enter a valid 10-digit phone number";
                        }
                        return null;
                      },
                    ),
                    CustomFormInput(
                      labelText: "Password",
                      hintText: 'Enter your password',
                      obscureText: obscureText,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      autoValidateMode: autovalidateMode,
                      suffixIcon: obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                      inputSpacing: 0,
                      suffixIconAction: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      onSaved: (String? value) {
                        password = value!;
                      },
                      onChanged: (value) {
                        if (value.length >= 4 &&
                            formKey.currentState!.validate()) {
                          setState(() {
                            isButtonActive = true;
                          });
                        }
                        //} else {
                        //  setState(() {
                        //    isButtonActive = false;
                        //  });
                        //}
                        if (autovalidateMode ==
                            AutovalidateMode.onUserInteraction) {
                          formKey.currentState!.validate();
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isButtonActive = true;
                            });
                            formKey.currentState!.save();
                          } else {
                            setState(() {
                              isButtonActive = false;
                            });
                          }
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password is required";
                        } else if (value.length < 4) {
                          return "Enter a valid password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isButtonActive
                          ? () async {
                              if (formKey.currentState!.validate()) {
                                hideKeyboard();
                                //fire validation
                                setState(() {
                                  autovalidateMode =
                                      AutovalidateMode.onUserInteraction;
                                  isAbsorbing = true;
                                });
                                EasyLoading.instance.backgroundColor =
                                    Colors.black;
                                EasyLoading.instance.indicatorColor =
                                    textWhiteShadeLight;
                                EasyLoading.instance.indicatorType =
                                    EasyLoadingIndicatorType.ripple;
                                EasyLoading.instance.textStyle = TextStyle(
                                  fontSize: screenWidth <= 320 ? 16 : 18,
                                  color: pureWhite,
                                );
                                EasyLoading.show(
                                  status: 'Vefifying...',
                                  //indicator: const CupertinoActivityIndicator(
                                  //  animating: true,
                                  //),
                                );
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                EasyLoading.dismiss();
                                //code to get api response here
                                final res = await true;
                                if (res) {
                                  EasyLoading.instance.indicatorColor =
                                      extraGreen;
                                  EasyLoading.instance.textColor = pureWhite;
                                  EasyLoading.instance.textStyle = TextStyle(
                                    fontSize: screenWidth <= 320 ? 16 : 18,
                                    color: pureWhite,
                                  );
                                  EasyLoading.showSuccess(
                                    'Verification Successful!',
                                  );
                                  if (!mounted) return;
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => const App(),
                                      ),
                                      (route) => false);
                                } else {
                                  EasyLoading.instance.indicatorColor =
                                      extraRed;
                                  EasyLoading.instance.textStyle = TextStyle(
                                    fontSize: screenWidth <= 320 ? 16 : 18,
                                    color: pureWhite,
                                  );
                                  EasyLoading.instance.userInteractions = false;
                                  EasyLoading.showError(
                                    'Verification Failed!',
                                  );
                                }

                                if (res == false) {
                                  Timer(const Duration(seconds: 2), () {
                                    EasyLoading.instance.textStyle = TextStyle(
                                      fontSize: screenWidth <= 320 ? 13 : 18,
                                      color: const Color.fromARGB(
                                          255, 255, 85, 73),
                                    );
                                    EasyLoading.instance.userInteractions =
                                        true;

                                    EasyLoading.showToast(
                                      "Please Enter correct details",
                                      //toastPosition:
                                      //    EasyLoadingToastPosition.bottom,
                                    );
                                    setState(() {
                                      isAbsorbing = false;
                                    });
                                  });
                                }
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                EasyLoading.dismiss();
                                EasyLoading.removeAllCallbacks();
                              }
                            }
                          : null,
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                              color: isButtonActive
                                  ? secondaryBlueShadeDark
                                  : textWhiteShadeDark,
                            ),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          const Size.fromHeight(50),
                        ),
                      ),
                      child: const Text("VERIFY"),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
