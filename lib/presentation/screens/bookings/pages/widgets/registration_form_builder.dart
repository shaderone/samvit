import 'dart:convert';

import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:brechfete/presentation/screens/bookings/pages/expo_registration_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final ValueNotifier<bool> isRegistrationSuccessNotifier = ValueNotifier(false);

class RegistrationFormHolder extends StatefulWidget {
  final ValueChanged<BuildContext> sendContext;
  final bool isInstitution;
  const RegistrationFormHolder({
    Key? key,
    required this.isInstitution,
    required this.sendContext,
  }) : super(key: key);

  @override
  State<RegistrationFormHolder> createState() => RegistrationFormHolderState();
}

class RegistrationFormHolderState extends State<RegistrationFormHolder> {
  final _formKey = GlobalKey<FormState>();
  bool isTelephoneSwitched = false;

  //form data
  String institutionName = "";
  String institutionAddress = "";
  String institutionEmail = "";
  String institutionPhone = "";
  String institutionTelOrPhone = "";

  String facultyName = "";
  String facultyAddress = "";
  String facultyEmail = "";
  String facultyPhone = "";
  String facultyTelOrPhone = "";

  void manageContext() {
    widget.sendContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: () async {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          //return true to validate insittution
          manageContext();
          isValidatedNotifier.value = true;
        } else {
          //return false to validate insittution
          isValidatedNotifier.value = false;
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFormInput(
            labelText: "Name",
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText:
                "Enter ${widget.isInstitution ? "Institution" : "Faculty"} name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Name is required";
              }
              if (value.length >= 70) {
                return "Name is too long";
              }
              return null;
            },
            onSaved: (String? value) {
              widget.isInstitution
                  ? institutionName = value!
                  : facultyName = value!;
            },
          ),
          CustomFormInput(
            labelText: "Email",
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            hintText:
                "Enter ${widget.isInstitution ? "Institution" : "Faculty"} email",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              } else if (!EmailValidator.validate(value)) {
                return "Enter a valid email";
              }
              return null;
            },
            onSaved: (String? value) {
              widget.isInstitution
                  ? institutionEmail = value!
                  : facultyEmail = value!;
            },
          ),
          CustomFormInput(
            labelText: "Phone",
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            hintText:
                "Enter ${widget.isInstitution ? "Institution" : "Faculty"} phone",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Phone is required";
              } else if (value.length != 10) {
                return "Enter a valid phone number";
              }
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxInputLength: 10,
            inputSpacing: 0,
            onSaved: (String? value) {
              widget.isInstitution
                  ? institutionPhone = value!
                  : facultyPhone = value!;
            },
          ),
          const SizedBox(height: 10),
          CustomFormInput(
            labelText: "Landline / other",
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.done,
            hintText: "Enter ${isTelephoneSwitched ? "Phone" : "Landline"}",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "${widget.isInstitution ? "Institution" : "Faculty"} Landline/phone is required";
              } else if (value.length != 11 && !isTelephoneSwitched) {
                return "Enter a valid telephone";
              } else if (value.length != 10 && isTelephoneSwitched) {
                return "Enter a valid phone";
              }
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxInputLength: isTelephoneSwitched ? 10 : 11,
            suffixIcon: isTelephoneSwitched
                ? Icons.phone_android_rounded
                : MdiIcons.phoneClassic,
            suffixIconAction: () {
              setState(() {
                isTelephoneSwitched = !isTelephoneSwitched;
              });
            },
            inputSpacing: 0,
            onSaved: (String? value) {
              widget.isInstitution
                  ? institutionTelOrPhone = value!
                  : facultyTelOrPhone = value!;
            },
          ),
        ],
      ),
    );
  }

  //call this on register button
  static Future<bool> doRegistration() async {
    print("object");
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    final token = prefs.getString("token");
//    final selectedDate = prefs.getString("selectedTime");
//    final selectedTime = prefs.getString("selectedTime");
//    final slotCount = prefs.getString("slotCount");
//
//    Map<String, dynamic> formData = {
//      "date": selectedDate,
//      "time": selectedTime,
//      "slotcount": slotCount,
//      "cname": institutionName,
//      "cnmail": institutionEmail,
//      "cphone": institutionPhone,
//      "ctelorphone": institutionTelOrPhone,
//      "fname": institutionName,
//      "femail": institutionEmail,
//      "fphone": institutionPhone,
//      "ftelorphone": institutionTelOrPhone,
//    };
//
//    var client = http.Client();
//    var response = await client.post(
//      Uri.parse(
//        "$baseURL/book-slot",
//      ),
//      headers: {
//        "Content-Type": "application/json",
//        "Authorization": "Token $token"
//      },
//      body: jsonEncode(formData),
//    );

    //final data = jsonDecode(response.body);
    isRegistrationSuccessNotifier.value = true;
    return true;
    //show toast or other stuff
    //expected success or failure; if success show continue with payments
    //save this data into a valueNotifier
    //print(data);
  }
}
