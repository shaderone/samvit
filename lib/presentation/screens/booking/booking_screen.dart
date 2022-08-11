import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          Image.asset("assets/logo.png"),
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
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              //padding: EdgeInsets.symmetric(20),
              minimumSize: MaterialStateProperty.all(
                const Size.fromHeight(50),
              ),
            ),
            child: const Text("LOGIN"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
