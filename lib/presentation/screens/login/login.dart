import 'dart:async';

import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = primaryDark
    ..indicatorColor = Colors.yellow
    ..textColor = pureWhite
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
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

  //flutter_easyloading variables
  Timer? _timer;
  late double _progress;

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    onSaved: (String? value) {
                      phone = value!;
                    },
                    onChanged: (value) {
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
                            setState(() {
                              isAbsorbing = true;
                            });
                            EasyLoading.instance.backgroundColor = Colors.black;
                            EasyLoading.instance.backgroundColor = Colors.black;
                            EasyLoading.show(
                              status: 'Vefifying...',
                              indicator: const CupertinoActivityIndicator(
                                animating: true,
                              ),
                            );
                            await Future.delayed(const Duration(seconds: 2));
                            EasyLoading.dismiss();
                            //code to get api response here
                            final res = await true;
                            if (res) {
                              EasyLoading.instance.indicatorColor = extraGreen;
                              EasyLoading.showSuccess(
                                'Verification Successful!',
                                duration: const Duration(seconds: 2),
                              );
                              if (!mounted) return;
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => const BookingScreen(),
                              ));
                            } else {
                              EasyLoading.instance.indicatorColor = extraRed;
                              EasyLoading.showError(
                                'Verification Failed!',
                                duration: const Duration(seconds: 2),
                              );
                              setState(() {
                                isAbsorbing = false;
                              });
                            }

                            EasyLoading.dismiss();
                            EasyLoading.removeAllCallbacks();
                          }
                        : null,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
    );
  }
}
