import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/root/widgets/bottom_navbar.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:brechfete/presentation/screens/bookings/pages/expo_registration_page.dart';
import 'package:brechfete/presentation/screens/reservations/reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BookingSuccessPage extends StatelessWidget {
  final String? animationWidget;
  final String? statusText;
  const BookingSuccessPage({Key? key, this.animationWidget, this.statusText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                animationWidget ?? "assets/lottie_files/done.json",
                height: 200,
                width: 200,
                repeat: false,
                fit: BoxFit.contain,
              ),
              //show lottie animation
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  statusText ?? "Booking Confirmed!",
                  style: TextStyle(
                      fontSize: screenWidth <= extraSmallScreenWidth ? 28 : 30),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const [
                      TextSpan(
                        text: "A confirmation message will soon be sent to",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: textWhiteShadeLight,
                        ),
                      ),
                      TextSpan(
                        text: " FACULTY MAIL",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: secondaryBlueShadeLight,
                        ),
                      ),
                    ],
                  ),
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
                    primary: primaryDarkShadeLight,
                  ),
                  onPressed: () {
                    MaterialBottomNav.currentSelectedIndexNotifier.value = 0;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      App.home,
                      (route) => false,
                    );
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
                    MaterialBottomNav.currentSelectedIndexNotifier.value = 1;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      App.home,
                      (route) => false,
                    );
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
