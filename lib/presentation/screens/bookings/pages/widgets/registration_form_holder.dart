import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/widgets/custom_form_input.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class RegistrationFormHolder extends StatelessWidget {
  final bool isInstitution;

  final IconData suffixIcon;
  const RegistrationFormHolder({
    Key? key,
    required this.formKey1,
    required this.isInstitution,
    required this.suffixIcon,
  }) : super(key: key);

  final GlobalKey<FormState> formKey1;

  @override
  Widget build(BuildContext context) {
    return StickyHeader(
      header: Container(
        padding: const EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: bottomNavDark,
          borderRadius: BorderRadius.circular(5),
        ),
        child: isInstitution
            ? Text(
                "${isInstitution ? "INSTITUTION" : "Faculty"} INFO",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: secondaryBlueShadeLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            : Column(
                children: const [
                  Text(
                    "FACULTY INFO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: secondaryBlueShadeLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "(contact person from institution)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textWhiteShadeLight,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomFormInput(
              labelText: "Name",
              textInputType: TextInputType.name,
              textInputAction: TextInputAction.next,
              hintText:
                  "Enter ${isInstitution ? "Institution" : "Faculty"} name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Name is required";
                }
                return null;
              },
              onChanged: (value) {
                formKey1.currentState!.validate();
              },
            ),
            CustomFormInput(
              labelText: "Email",
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              hintText:
                  "Enter ${isInstitution ? "Institution" : "Faculty"} email",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                } else if (!EmailValidator.validate(value)) {
                  return "Enter a valid email";
                }
                return null;
              },
              onChanged: (value) {
                formKey1.currentState!.validate();
              },
            ),
            CustomFormInput(
              labelText: "Phone",
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.next,
              hintText:
                  "Enter ${isInstitution ? "Institution" : "Faculty"} phone",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Phone is required";
                }
                return null;
              },
              onChanged: (value) {
                formKey1.currentState!.validate();
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
              hintText: "Enter phone(other)",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "${isInstitution ? "Institution" : "Faculty"} Landline or other phone is required";
                } else if (value.length > 11) {
                  return "Enter a valid phone number";
                }
                return null;
              },
              onChanged: (value) {
                formKey1.currentState!.validate();
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              maxInputLength: 11,
              suffixIcon: suffixIcon,
            ),
          ],
        ),
      ),
    );
  }
}
