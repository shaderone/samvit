import 'package:brechfete/core/constants.dart';
import 'package:flutter/material.dart';

class ExpoRegistration extends StatelessWidget {
  const ExpoRegistration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset("assets/images/logo.png", width: 30),
            const SizedBox(width: 15),
            Text(
              "Expo Registration",
              style: TextStyle(
                fontSize: screenWidth <= 320 ? 20 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_rounded,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "INSTITUTION INFO",
                style: TextStyle(
                  color: secondaryBlueShadeLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Divider(
                color: textWhiteShadeLight,
                thickness: 1,
              ),
              SizedBox(height: 10),
              Text(
                "FACULTY INFO",
                style: TextStyle(
                  color: secondaryBlueShadeLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Divider(
                color: textWhiteShadeLight,
                thickness: 1,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

//-------------------------validators--------------------//
  String? validateEmail(String? email) {
    RegExp regexEmail = RegExp(r'\w+@\w+\.\w+');
    if (email == null || email.isEmpty || !regexEmail.hasMatch(email)) {
      return "Email is required";
    } else if (!regexEmail.hasMatch(email)) {
      return "Oops! That doesn't look like a valid email";
    }
    return null;
  }

  void _doRegistration() {}
}

class SlotButtons extends StatelessWidget {
  const SlotButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                primaryDarkShadeLight,
              ),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text("Pay Later"),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text("Pay Now"),
            ),
          ),
        ],
      ),
    );
  }
}
