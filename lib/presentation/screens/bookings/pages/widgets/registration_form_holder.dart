import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InstitutionFormHolder extends StatefulWidget {
  final GlobalKey<FormState> institutionFormKey;
  const InstitutionFormHolder({
    Key? key,
    required this.institutionFormKey,
  }) : super(key: key);

  @override
  State<InstitutionFormHolder> createState() => _RegistrationFormHolderState();
}

class _RegistrationFormHolderState extends State<InstitutionFormHolder> {
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
          hintText: "Enter Institution name",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Name is required";
            }
            return null;
          },
          onChanged: (value) {
            widget.institutionFormKey.currentState!.validate();
          },
        ),
        CustomFormInput(
          labelText: "Email",
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          hintText: "Enter Institution email",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Email is required";
            } else if (!EmailValidator.validate(value)) {
              return "Enter a valid email";
            }
            return null;
          },
          onChanged: (value) {
            widget.institutionFormKey.currentState!.validate();
          },
        ),
        CustomFormInput(
          labelText: "Phone",
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
          hintText: "Enter Institution phone",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Phone is required";
            }
            return null;
          },
          onChanged: (value) {
            widget.institutionFormKey.currentState!.validate();
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
              return "Institution Landline/phone is required";
            } else if (value.length > 11) {
              return "Enter a valid phone number";
            }
            return null;
          },
          onChanged: (value) {
            widget.institutionFormKey.currentState!.validate();
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

class FacultyFormHolder extends StatefulWidget {
  final GlobalKey<FormState> facultyFormKey;
  const FacultyFormHolder({
    Key? key,
    required this.facultyFormKey,
  }) : super(key: key);

  @override
  State<FacultyFormHolder> createState() => _FacultyFormHolderState();
}

class _FacultyFormHolderState extends State<FacultyFormHolder> {
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
          hintText: "Enter Faculty name",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Name is required";
            }
            return null;
          },
          onChanged: (value) {
            widget.facultyFormKey.currentState!.validate();
          },
        ),
        CustomFormInput(
          labelText: "Email",
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          hintText: "Enter Faculty email",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Email is required";
            } else if (!EmailValidator.validate(value)) {
              return "Enter a valid email";
            }
            return null;
          },
          onChanged: (value) {
            widget.facultyFormKey.currentState!.validate();
          },
        ),
        CustomFormInput(
          labelText: "Phone",
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
          hintText: "Enter Faculty phone",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Phone is required";
            }
            return null;
          },
          onChanged: (value) {
            widget.facultyFormKey.currentState!.validate();
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
              return "Faculty Landline/phone is required";
            } else if (value.length > 11) {
              return "Enter a valid phone number";
            }
            return null;
          },
          onChanged: (value) {
            widget.facultyFormKey.currentState!.validate();
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
