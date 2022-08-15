import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/booking/widgets/registration_form_widget.dart';
import 'package:brechfete/presentation/screens/booking/widgets/slot_date_time_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  ExpRegistration createState() => ExpRegistration();
}

class ExpRegistration extends State<BookingScreen> {
  final Map<String, String> _loginObject = <String, String>{};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _shouldAutoValidate = false;

  //controllers
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _schoolEmailController = TextEditingController();
  final TextEditingController _schoolPhoneController = TextEditingController();
  final TextEditingController _schoolPhoneOptionalController =
      TextEditingController();
  final TextEditingController _schoolAddressController =
      TextEditingController();
  final TextEditingController _facultyEmailOrPhoneController =
      TextEditingController();

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
      ),
      SlotDateTimeBooking(
        schoolName: _schoolNameController.text,
        schoolEmail: _schoolEmailController.text,
        schoolPhone: _schoolPhoneController.text,
        schoolPhoneOptional: _schoolPhoneOptionalController.text,
        schoolAddress: _schoolAddressController.text,
        facultyPhoneOrEmail: _facultyEmailOrPhoneController.text,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryDarkShadeLight,
          statusBarBrightness: Brightness.dark,
        ),
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
      body: IndexedStack(
        index: newIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _doERegistration,
        child: const Icon(Icons.arrow_right_alt_rounded),
      ),
    );
  }

  Widget get _buildschoolNameField {
    return TextFormField(
      controller: _schoolNameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: strokeLight,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: "Phone",
        floatingLabelStyle: const TextStyle(
          fontSize: 20,
          color: textWhiteShadeLight,
        ),
        hintText: 'Enter your phone number',
        hintStyle: const TextStyle(
          color: textWhiteShadeDark,
        ),
      ),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (val) {
        FocusScope.of(context).requestFocus(_schoolNameFocusNode);
      },
      onSaved: (String? val) => _loginObject['email'] = val!,
      /*
      ~error : The argument type 'String? Function(String)' can't be assigned to the parameter type 'String? Function(String?)?'
      ------ cause : did not null checked argument
      */
      validator: _validateEmail,
      autofocus: true,
      focusNode: _schoolNameFocusNode,
    );
  }

  Widget get _buildSchoolEmailField {
    return TextFormField(
      controller: _schoolEmailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: strokeLight,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: "Phone",
        floatingLabelStyle: const TextStyle(
          fontSize: 20,
          color: textWhiteShadeLight,
        ),
        hintText: 'Enter your phone number',
        hintStyle: const TextStyle(
          color: textWhiteShadeDark,
        ),
      ),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (val) {
        FocusScope.of(context).requestFocus(_schoolEmailFocusNode);
      },
      onSaved: (String? val) => _loginObject['email'] = val!,
      validator: _validateEmail,
      autofocus: true,
      focusNode: _schoolEmailFocusNode,
    );
  }

  Widget get _buildSchoolPhoneField {
    return TextFormField(
      controller: _schoolEmailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: strokeLight,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: "Phone",
        floatingLabelStyle: const TextStyle(
          fontSize: 20,
          color: textWhiteShadeLight,
        ),
        hintText: 'Enter your phone number',
        hintStyle: const TextStyle(
          color: textWhiteShadeDark,
        ),
      ),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (val) {
        FocusScope.of(context).requestFocus(_schoolPhoneFocusNode);
      },
      onSaved: (String? val) => _loginObject['email'] = val!,
      validator: _validateEmail,
      autofocus: true,
      focusNode: _schoolPhoneFocusNode,
    );
  }

  Widget get _buildSchoolPhoneOptionalField {
    return TextFormField(
      controller: _schoolEmailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: strokeLight,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: "Phone",
        floatingLabelStyle: const TextStyle(
          fontSize: 20,
          color: textWhiteShadeLight,
        ),
        hintText: 'Enter your phone number',
        hintStyle: const TextStyle(
          color: textWhiteShadeDark,
        ),
      ),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (val) {
        FocusScope.of(context).requestFocus(_schoolPhoneOptionalFocusNode);
      },
      onSaved: (String? val) => _loginObject['email'] = val!,
      validator: _validateEmail,
      autofocus: true,
      focusNode: _schoolPhoneOptionalFocusNode,
    );
  }

  Widget get _buildSchoolAddressField {
    return TextFormField(
      controller: _schoolEmailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: strokeLight,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: "Phone",
        floatingLabelStyle: const TextStyle(
          fontSize: 20,
          color: textWhiteShadeLight,
        ),
        hintText: 'Enter your phone number',
        hintStyle: const TextStyle(
          color: textWhiteShadeDark,
        ),
      ),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (val) {
        FocusScope.of(context).requestFocus(_schoolAddressFocusNode);
      },
      onSaved: (String? val) => _loginObject['email'] = val!,
      validator: _validateEmail,
      autofocus: true,
      focusNode: _schoolAddressFocusNode,
    );
  }

  Widget get _buildFacultyPhoneOrEmailField {
    return TextFormField(
      controller: _schoolEmailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: strokeLight,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: "Phone",
        floatingLabelStyle: const TextStyle(
          fontSize: 20,
          color: textWhiteShadeLight,
        ),
        hintText: 'Enter your phone number',
        hintStyle: const TextStyle(
          color: textWhiteShadeDark,
        ),
      ),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (val) {
        FocusScope.of(context).requestFocus(_facultyEmailOrPhoneFocusNode);
      },
      onSaved: (String? val) => _loginObject['email'] = val!,
      validator: _validateEmail,
      autofocus: true,
      focusNode: _facultyEmailOrPhoneFocusNode,
    );
  }

//-------------------------validators--------------------//
  String? _validateEmail(String? email) {
    RegExp regexEmail = RegExp(r'\w+@\w+\.\w+');
    if (email == null || email.isEmpty || !regexEmail.hasMatch(email)) {
      return "Email is required";
    } else if (!regexEmail.hasMatch(email)) {
      return "Oops! That doesn't look like a valid email";
    }
    return null;
  }

  void _doERegistration() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("""
    The user has BookingScreen with an email address of '${_loginObject['email']}' 
    and a password of '${_loginObject['password']}'
    """);
    }
    setState(() {
      _shouldAutoValidate = true;
    });
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return SlotDateTimeBooking(
        schoolName: _schoolNameController.text,
        schoolEmail: _schoolEmailController.text,
        schoolAddress: _schoolAddressController.text,
        facultyPhoneOrEmail: _facultyEmailOrPhoneController.text,
        schoolPhone: _schoolPhoneController.text,
        schoolPhoneOptional: _schoolPhoneOptionalController.text,
      );
    }));
  }
}
