import 'package:flutter/material.dart';

class RegistrationFormWidget extends StatelessWidget {
  const RegistrationFormWidget({
    Key? key,
    required bool shouldAutoValidate,
    required GlobalKey<FormState> formKey,
    required this.buildschoolNameField,
    required this.buildSchoolEmailField,
    required this.buildSchoolPhoneField,
    required this.buildSchoolPhoneOptionalField,
    required this.buildSchoolAddressField,
    required this.buildFacultyPhoneOrEmailField,
  })  : _shouldAutoValidate = shouldAutoValidate,
        _formKey = formKey,
        super(key: key);

  final bool _shouldAutoValidate;
  final GlobalKey<FormState> _formKey;
  final Widget buildschoolNameField;
  final Widget buildSchoolEmailField;
  final Widget buildSchoolPhoneField;
  final Widget buildSchoolPhoneOptionalField;
  final Widget buildSchoolAddressField;
  final Widget buildFacultyPhoneOrEmailField;

  @override
  Widget build(BuildContext context) {
    return Form(
      //if autovalidate is == true
      autovalidateMode: _shouldAutoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              buildschoolNameField,
              const SizedBox(height: 20),
              buildSchoolEmailField,
              const SizedBox(height: 20),
              buildSchoolPhoneField,
              const SizedBox(height: 20),
              buildSchoolAddressField,
              const SizedBox(height: 20),
              buildFacultyPhoneOrEmailField,
            ],
          ),
        ),
      ),
    );
  }
}
