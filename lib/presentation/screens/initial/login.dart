import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/app.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(20),
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
              TextFormField(
                keyboardType: TextInputType.number,
                //input value style
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textWhiteShadeDark,
                ),
                //common decoration
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.check,
                    color: textWhiteShadeLight,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  //floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: strokeLight,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: "Phone",
                  floatingLabelStyle: const TextStyle(
                    fontSize: 20,
                    color: textWhiteShadeLight,
                  ),
                  hintText: 'Enter your phone number',
                  hintStyle: const TextStyle(
                    color: textWhiteShadeDark,
                  ),
                ),
                //events and validations
                onChanged: (value) {
                  //make api call to check phone here, if it returns true, make the check mark visible with blue color, else display a message phone number not verified

                  //on pressing login, user recieves OTP and enter it (autocomplete)

                  //finally move to booking screen
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                    App.home,
                  );
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
    );
  }
}
