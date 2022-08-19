import 'package:flutter/material.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/slot_status_widgets/slot_info_container.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/time_slot_widget.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/calendar_widget.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/calendar_widgets/calendar_status_widget.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset("assets/images/logo.png", width: 30),
            const SizedBox(width: 15),
            Text(
              "Expo Slot Booking",
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
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            CalendarStatus(),
            SizedBox(height: 20),
            SlotCalender(),
            TimeSlotList(),
            SizedBox(height: 30),
            SlotInfoContainer(),
            SizedBox(height: 30),
            ConfirmButton(),
          ],
        ),
      ),
    );
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //save the form data here

        //After saving, go to next page
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size.fromHeight(50),
        ),
      ),
      child: const Text("Confirm Slots"),
    );
  }
}
