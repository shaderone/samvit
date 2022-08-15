import 'package:flutter/material.dart';

class SlotDateTimeBooking extends StatelessWidget {
  final String schoolName,
      schoolEmail,
      schoolAddress,
      facultyPhoneOrEmail,
      schoolPhone,
      schoolPhoneOptional;
  const SlotDateTimeBooking({
    Key? key,
    required this.schoolEmail,
    required this.schoolAddress,
    required this.facultyPhoneOrEmail,
    required this.schoolPhone,
    required this.schoolPhoneOptional,
    required this.schoolName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("book slots"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(schoolName),
            Text(schoolEmail),
            Text(schoolPhone),
            Text(schoolPhoneOptional),
            Text(schoolAddress),
            Text(facultyPhoneOrEmail),
          ],
        ),
      ),
    );
  }
}
