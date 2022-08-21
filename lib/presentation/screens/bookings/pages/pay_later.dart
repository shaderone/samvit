import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/screens/bookings/pages/expo_registration.dart';
import 'package:brechfete/presentation/screens/reservations/reservation_screen.dart';
import 'package:flutter/material.dart';

class PayLaterPage extends StatelessWidget {
  const PayLaterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //show lottie animation
              const Text(
                "Booking Confirmed!",
                style: TextStyle(fontSize: 32),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(
                      50,
                    ), // fromHeight use double.infinity as width and 40 is the height
                    primary: primaryDarkShadeLight,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const ReservationScreen(),
                        ),
                        (route) => true);
                  },
                  child: const Text("Book More"),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(
                      50,
                    ), // fromHeight use double.infinity as width and 40 is the height
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const ReservationScreen(),
                        ),
                        (route) => true);
                  },
                  child: const Text("Go to reservations"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
