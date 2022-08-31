import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:brechfete/presentation/screens/bookings/pages/expo_registration_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegistrationFormHolder extends StatefulWidget {
  final bool isInstitution;
  const RegistrationFormHolder({
    Key? key,
    required this.isInstitution,
  }) : super(key: key);

  @override
  State<RegistrationFormHolder> createState() => _RegistrationFormHolderState();
}

class _RegistrationFormHolderState extends State<RegistrationFormHolder> {
  final _formKey = GlobalKey<FormState>();
  bool isTelephoneSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      onChanged: () {
        if (_formKey.currentState!.validate()) {
          print("success");
          //_formKey.currentState!.save();
          //return true to validate insittution
          isValidatedNotifier.value = true;
        } else {
          print("failed");
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
              return null;
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
              }
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxInputLength: 10,
            inputSpacing: 0,
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
              } else if (value.length > 11) {
                return "Enter a valid phone number";
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
          ),
        ],
      ),
    );
  }
}
