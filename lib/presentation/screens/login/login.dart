import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  onPressed: isButtonActive ? () {} : null,
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
    );
  }
}
