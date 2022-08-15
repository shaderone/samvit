import 'package:brechfete/core/constants.dart';
import 'package:brechfete/domain/screens/bookings/booking_modal.dart';
import 'package:brechfete/presentation/root/widgets/form_input_builder.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/slot_date_time_booking.dart';
import 'package:flutter/material.dart';

class ExpoRegistration extends StatelessWidget {
  final BookingsModal bookingsModal;

  final TextEditingController institutionNameController =
      TextEditingController();

  final TextEditingController institutionPhoneorEmailController =
      TextEditingController();

  final TextEditingController institutionPhoneOptionalController =
      TextEditingController();

  final TextEditingController institutionAddressController =
      TextEditingController();

  final TextEditingController facultyNameController = TextEditingController();

  final TextEditingController facultyEmailOrPhoneController =
      TextEditingController();

  final TextEditingController facultyPhoneOptionalController =
      TextEditingController();

  ExpoRegistration({
    Key? key,
    required this.bookingsModal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    institutionNameController.text = bookingsModal.institutionName;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset("assets/logo.png", width: 30),
            const SizedBox(width: 15),
            Text(
              "Expo Registration",
              style: TextStyle(
                fontSize: screenWidth <= 320 ? 20 : 24,
                fontWeight: FontWeight.bold,
              ),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "INSTITUTION INFO",
                style: TextStyle(
                  color: secondaryBlueShadeLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Divider(
                color: textWhiteShadeLight,
                thickness: 1,
              ),
              const SizedBox(height: 10),
              FormInputBuilder(
                controller: institutionNameController,
                labelText: "Name",
                hintText: "",
                textInputType: TextInputType.name,
                autoFocus: true,
              ),
              const SizedBox(height: 20),
              FormInputBuilder(
                controller: institutionPhoneorEmailController,
                labelText: "Phone or Email",
                hintText: "",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              FormInputBuilder(
                controller: institutionPhoneOptionalController,
                labelText: "Phone other(optional)",
                hintText: "",
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              const Text(
                "FACULTY INFO",
                style: TextStyle(
                  color: secondaryBlueShadeLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Divider(
                color: textWhiteShadeLight,
                thickness: 1,
              ),
              const SizedBox(height: 10),
              FormInputBuilder(
                controller: facultyNameController,
                labelText: "Name",
                hintText: "",
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 20),
              FormInputBuilder(
                controller: facultyEmailOrPhoneController,
                labelText: "Phone or email",
                hintText: "",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              FormInputBuilder(
                controller: facultyPhoneOptionalController,
                labelText: "Phone other(optional)",
                hintText: "",
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //save the form data here
                  bookingsModal.institutionName =
                      institutionNameController.text;
                  bookingsModal.institutionPhoneOrEmail =
                      institutionPhoneorEmailController.text;
                  bookingsModal.institutionPhoneOptional =
                      institutionPhoneOptionalController.text;
                  bookingsModal.facultyName = facultyNameController.text;
                  bookingsModal.facultyPhoneOrEmail =
                      facultyEmailOrPhoneController.text;
                  bookingsModal.facultyPhoneOptional =
                      facultyPhoneOptionalController.text;

                  //After saving, go to next page
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SlotDateTimeBooking(
                        bookingsModal: bookingsModal,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    const Size.fromHeight(50),
                  ),
                ),
                child: const Text("Proceed to book slots"),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
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

  void _doRegistration() {}
}
