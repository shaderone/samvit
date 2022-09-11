import 'dart:async';
import 'dart:convert';
import 'package:samvit/core/constants.dart';
import 'package:samvit/presentation/root/app.dart';
import 'package:samvit/presentation/root/widgets/custom_form_input.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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

  String loginErrorText = '';

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
          onTap: () => hideKeyboard(context),
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
                    GradientText(
                      'Samvit 2.0',
                      style: GoogleFonts.pacifico(
                        fontSize: screenWidth <= 320 ? 20 : 40,
                      ),
                      colors: const [
                        Color(0xFF6E6F71),
                        Color(0xFFECECEC),
                      ],
                    ),
                    const SizedBox(height: 20),
                    //ClipRRect(
                    //  borderRadius: BorderRadius.circular(8),
                    //  child: Image.asset("assets/images/samvit.png"),
                    //),
                    //const SizedBox(height: 50),
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
                          formKey.currentState!.save();
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
                          formKey.currentState!.save();
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
                                hideKeyboard(context);
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
                                EasyLoading.show(status: 'Verifying...');
                                var client = http.Client();
                                var response = await client.post(
                                  Uri.parse(
                                    "$baseURL/auth/token/login/",
                                  ),
                                  headers: {
                                    "Content-Type": "application/json",
                                  },
                                  body: jsonEncode(
                                    {
                                      'phone': phone,
                                      'password': password,
                                    },
                                  ),
                                );
                                EasyLoading.dismiss();
                                final data = jsonDecode(
                                  response.body.toString(),
                                );
                                //print(isAbsorbing);
                                if (response.statusCode == 200) {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  final token = data["auth_token"];
                                  prefs.setString("token", token);
                                  //print(prefs.getString("token"));
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
                                } else if (response.statusCode == 400) {
                                  setState(() {
                                    loginErrorText =
                                        "Please Enter correct details";
                                  });
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

                                if (response.statusCode == 400) {
                                  Timer(const Duration(seconds: 2), () {
                                    EasyLoading.instance.textStyle = TextStyle(
                                      fontSize: screenWidth <= 320 ? 13 : 18,
                                      color: const Color.fromARGB(
                                          255, 255, 85, 73),
                                    );
                                    EasyLoading.instance.userInteractions =
                                        true;

                                    EasyLoading.showToast(
                                      loginErrorText,
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
}

void hideKeyboard(context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
