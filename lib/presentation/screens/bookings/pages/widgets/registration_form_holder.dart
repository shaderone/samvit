import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class RegistrationFormHolder extends StatefulWidget {
  final bool isInstitution;
  const RegistrationFormHolder({
    Key? key,
    required this.formKey1,
    required this.isInstitution,
  }) : super(key: key);

  final GlobalKey<FormState> formKey1;

  @override
  State<RegistrationFormHolder> createState() => _RegistrationFormHolderState();
}

class _RegistrationFormHolderState extends State<RegistrationFormHolder> {
  bool isTelephoneSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          onChanged: (value) {
            widget.formKey1.currentState!.validate();
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
          onChanged: (value) {
            widget.formKey1.currentState!.validate();
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
          onChanged: (value) {
            widget.formKey1.currentState!.validate();
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
          textInputAction: TextInputAction.next,
          hintText: "Enter ${isTelephoneSwitched ? "Phone" : "Landline"}",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "${widget.isInstitution ? "Institution" : "Faculty"} Landline or other phone is required";
            } else if (value.length > 11) {
              return "Enter a valid phone number";
            }
            return null;
          },
          onChanged: (value) {
            widget.formKey1.currentState!.validate();
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
    );
  }
}
