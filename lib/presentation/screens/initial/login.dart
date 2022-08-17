import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:flutter/material.dart';
import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

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
                    "BerchFete",
                    style: TextStyle(fontSize: 26),
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset("assets/images/logo.png"),
                const SizedBox(height: 50),
                CustomFormInput(
                  labelText: "Phone",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  maxInputLength: 10,
                  suffixIcon: Icons.check,
                  inputSpacing: 0,
                  hintText: 'Enter your phone number',
                  onChanged: (value) {
                    formKey.currentState!.validate();
                    //send api request here, if the data doesn't match call the validate() - phone number doesn't match, if success change the color of the check icon, make sure to send only NUMBER
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
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  textInputType: TextInputType.text,
                  suffixIcon: Icons.check,
                  hintText: 'Enter your password',
                  inputSpacing: 0,
                  onChanged: (value) {
                    formKey.currentState!.validate();
                    //send api request here, if the data doesn't match call the validate() - password doesn't match, if success change the color of the check icon
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "password is required";
                    } else if (value.length < 5) {
                      return "Enter a valid password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print("login successfull");
                      Navigator.of(context).pushReplacementNamed(
                        App.home,
                      );
                    } else {
                      print("login failed!");
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      const Size.fromHeight(50),
                    ),
                  ),
                  child: const Text("LOGIN"),
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
