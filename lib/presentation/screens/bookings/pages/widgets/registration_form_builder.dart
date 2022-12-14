import 'dart:convert';
import 'dart:developer';
import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:brechfete/presentation/screens/bookings/pages/expo_registration_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  static String institutionName = "";
  static String institutionAddress = "";
  static String institutionEmail = "";
  static String institutionPhone = "";
  static String institutionTelOrPhone = "";

  static String facultyName = "";
  static String facultyAddress = "";
  static String facultyEmail = "";
  static String facultyPhone = "";
  static String facultyTelOrPhone = "";

  void manageContext() {
    widget.sendContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: () {
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
          Visibility(
            visible: widget.isInstitution,
            child: CustomFormInput(
              labelText: "location",
              textInputType: TextInputType.multiline,
              textInputAction: TextInputAction.next,
              hintText: "eg: city, district",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Address is required";
                }
                return null;
              },
              onSaved: (String? value) {
                institutionAddress = value!;
              },
            ),
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
          widget.isInstitution
              ? const SizedBox()
              : CustomFormInput(
                  labelText: "Phone",
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  hintText: "Enter faculty phone",
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
                    facultyPhone = value!;
                  },
                ),
          SizedBox(height: widget.isInstitution ? 0 : 10),
          widget.isInstitution
              ? const SizedBox()
              : CustomFormInput(
                  labelText: "optional phone",
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  hintText: "Enter optional phone",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    } else if (value.length != 10) {
                      return "Enter a valid phone";
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxInputLength: 10,
                  inputSpacing: 0,
                  onSaved: (String? value) {
                    facultyTelOrPhone = value!;
                  },
                ),
        ],
      ),
    );
  }

  //call this on register button
  static Future<bool> doRegistration() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final selectedDate = prefs.getString("selectedDate");
    final selectedTime = prefs.getString("selectedTime");
    final slotCount = prefs.getString("slotCount");

    Map<String, dynamic> formData = {
      "date": selectedDate,
      "time": selectedTime,
      "slotcount": slotCount,
      "cname": institutionName,
      "caddress": institutionAddress,
      "cemail": institutionEmail,
      "fname": facultyName,
      "femail": facultyEmail,
      "fphone": facultyPhone,
      "ftelorphone": facultyTelOrPhone,
    };
    EasyLoading.show(
      status: 'processing...',
    );
    var client = http.Client();
    var response = await client.post(
      Uri.parse(
        "$baseURL/book-slot/",
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Token $token"
      },
      body: jsonEncode(formData),
    );
    EasyLoading.dismiss();
    final data = jsonDecode(response.body);
    final id = data['id'];
    final isRegistered = data['is_registered'];
    final registrationError = data['error'];
    if (response.statusCode == 201) {
      isRegistrationSuccessNotifier.value = isRegistered;
      prefs.setString("regToken", id);
    } else {
      Fluttertoast.showToast(
        msg: registrationError,
        textColor: extraRed,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
    return isRegistered;
  }
}
