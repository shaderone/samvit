import 'dart:developer';
import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/booking/widgets/registration_form_widget.dart';
import 'package:brechfete/presentation/screens/booking/widgets/slot_date_time_booking.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  static final TextEditingController schoolNameController =
      TextEditingController();
  static final TextEditingController schoolEmailController =
      TextEditingController();

  static final TextEditingController schoolPhoneController =
      TextEditingController();

  static final TextEditingController schoolPhoneOptionalController =
      TextEditingController();

  static final TextEditingController schoolAddressController =
      TextEditingController();

  static final TextEditingController facultyEmailOrPhoneController =
      TextEditingController();

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final Map<String, String> _loginObject = <String, String>{};

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _shouldAutoValidate = false;

  //focusNodes for field swtiching using onFieldSubmitted
  final FocusNode _schoolNameFocusNode = FocusNode();

  final FocusNode _schoolEmailFocusNode = FocusNode();

  final FocusNode _schoolPhoneFocusNode = FocusNode();

  final FocusNode _schoolPhoneOptionalFocusNode = FocusNode();

  final FocusNode _schoolAddressFocusNode = FocusNode();

  final FocusNode _facultyEmailOrPhoneFocusNode = FocusNode();

  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      RegistrationFormWidget(
        shouldAutoValidate: _shouldAutoValidate,
        formKey: _formKey,
        buildschoolNameField: _buildschoolNameField,
        buildSchoolEmailField: _buildSchoolEmailField,
        buildSchoolPhoneField: _buildSchoolPhoneField,
        buildSchoolPhoneOptionalField: _buildSchoolPhoneOptionalField,
        buildSchoolAddressField: _buildSchoolAddressField,
        buildFacultyPhoneOrEmailField: _buildFacultyPhoneOrEmailField,
        doRegistration: _doRegistration,
      ),
      SlotDateTimeBooking(
        schoolName: BookingScreen.schoolNameController.text,
        schoolEmail: BookingScreen.schoolEmailController.text,
        schoolPhone: BookingScreen.schoolPhoneController.text,
        schoolPhoneOptional: BookingScreen.schoolPhoneOptionalController.text,
        schoolAddress: BookingScreen.schoolAddressController.text,
        facultyPhoneOrEmail: BookingScreen.facultyEmailOrPhoneController.text,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 25,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset("assets/logo.png", width: 30),
            const SizedBox(width: 15),
            const Text(
              "Expo Registration",
              style: TextStyle(fontSize: 24),
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
      body: IndexedStack(index: newIndex, children: pages),
    );
  }

  Widget get _buildschoolNameField {
    return FormInputbuilder(
      controller: BookingScreen.schoolNameController,
      textInputType: TextInputType.name,
      labelText: "Name",
      hintText: "Enter School Name",
      focusNode: _schoolNameFocusNode,
      loginObject: _loginObject,
    );
  }

  Widget get _buildSchoolEmailField {
    return FormInputbuilder(
      controller: BookingScreen.schoolNameController,
      textInputType: TextInputType.emailAddress,
      labelText: "School Email",
      hintText: "Enter School Email Address",
      focusNode: _schoolEmailFocusNode,
      loginObject: _loginObject,
    );
  }

  Widget get _buildSchoolPhoneField {
    return FormInputbuilder(
      controller: BookingScreen.schoolPhoneController,
      textInputType: TextInputType.number,
      labelText: "School Phone",
      hintText: "Enter School Phone number",
      focusNode: _schoolPhoneFocusNode,
      loginObject: _loginObject,
    );
  }

  Widget get _buildSchoolPhoneOptionalField {
    return FormInputbuilder(
      controller: BookingScreen.schoolPhoneOptionalController,
      textInputType: TextInputType.name,
      labelText: "School Phone(optional)",
      hintText: "Enter School phone number",
      focusNode: _schoolPhoneOptionalFocusNode,
      loginObject: _loginObject,
    );
  }

  Widget get _buildSchoolAddressField {
    return FormInputbuilder(
      controller: BookingScreen.schoolAddressController,
      textInputType: TextInputType.streetAddress,
      labelText: "School Address",
      hintText: "Enter School Address",
      focusNode: _schoolAddressFocusNode,
      loginObject: _loginObject,
    );
  }

  Widget get _buildFacultyPhoneOrEmailField {
    return FormInputbuilder(
      controller: BookingScreen.facultyEmailOrPhoneController,
      textInputType: TextInputType.text,
      labelText: "Faculty phone or email",
      hintText: "Enter faculty phone or email",
      textInputAction: TextInputAction.done,
      focusNode: _facultyEmailOrPhoneFocusNode,
      loginObject: _loginObject,
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

  void _doRegistration() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      log("""
    The user has BookingScreen with an email address of '${_loginObject['email']}' 
    and a password of '${_loginObject['password']}'
    """);
    }
    setState(() {
      _shouldAutoValidate = true;
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SlotDateTimeBooking(
            schoolName: BookingScreen.schoolNameController.text,
            schoolEmail: BookingScreen.schoolEmailController.text,
            schoolAddress: BookingScreen.schoolAddressController.text,
            facultyPhoneOrEmail:
                BookingScreen.facultyEmailOrPhoneController.text,
            schoolPhone: BookingScreen.schoolPhoneController.text,
            schoolPhoneOptional:
                BookingScreen.schoolPhoneOptionalController.text,
          );
        },
      ),
    );
  }
}

class FormInputbuilder extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String labelText;
  final String hintText;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final Map<String, String> loginObject;
  final String? Function(String?)? validator;
  const FormInputbuilder({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.labelText,
    required this.hintText,
    this.textInputAction = TextInputAction.next,
    required this.focusNode,
    required this.loginObject,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: strokeLight,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: labelText,
        floatingLabelStyle: const TextStyle(
          fontSize: 20,
          color: textWhiteShadeLight,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: textWhiteShadeDark,
        ),
      ),
      textInputAction: textInputAction,
      onFieldSubmitted: (val) {
        FocusScope.of(context).requestFocus(focusNode);
      },
      //dynamic data here
      onSaved: (String? val) => loginObject['email'] = val!,
      validator: validator,
      autofocus: true,
      focusNode: focusNode,
    );
  }
}
