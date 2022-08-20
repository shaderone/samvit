import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/expo_registration.dart';
import 'package:flutter/material.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/slot_status_widgets/slot_info_container.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/time_slot_widget.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/calendar_widget.dart';
import 'package:brechfete/presentation/screens/bookings/widgets/calendar_widgets/calendar_status_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
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
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.remove("token");
              if (!mounted) return;
              Navigator.of(context).pushReplacementNamed(App.loginRoute);
            },
            icon: const Icon(
              Icons.logout_rounded,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: screenWidth <= 340 ? 10 : 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            CalendarStatus(),
            SizedBox(height: 10),
            SlotCalender(),
            TimeSlotList(),
            SizedBox(height: 10),
            SlotInfoContainer(),
            SizedBox(height: 30),
            ConfirmButton(),
            SizedBox(height: 30),
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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ExpoRegistration(),
          ),
        );
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
