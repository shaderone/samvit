import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/bookings/pages/widgets/registration_form_buttons.dart';
import 'package:brechfete/presentation/screens/bookings/pages/widgets/registration_form_holder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ExpoRegistration extends StatelessWidget {
  static final formKey1 = GlobalKey<FormState>();
  const ExpoRegistration({
    Key? key,
  }) : super(key: key);

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
          child: Form(
            key: formKey1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegistrationFormHolder(
                  formKey1: formKey1,
                  isInstitution: true,
                  suffixIcon: MdiIcons.phoneClassic,
                ),
                RegistrationFormHolder(
                  formKey1: formKey1,
                  isInstitution: false,
                  suffixIcon: MdiIcons.phoneClassic,
                ),
                RegistrationFormButtons(
                    formKey1: formKey1, screenWidth: screenWidth),
                const SizedBox(height: 100),
              ],
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
