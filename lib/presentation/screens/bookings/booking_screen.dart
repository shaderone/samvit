import 'package:flutter/material.dart';
import 'package:brechfete/domain/screens/bookings/booking_modal.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/expo_registration.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  final int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    //to preserve form state
    return ExpoRegistration(
      bookingsModal: BookingsModal("", "", "", "", "", ""),
    );
  }
}
