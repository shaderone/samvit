import 'package:brechfete/presentation/root/widgets/bottom_navbar.dart';

import 'package:brechfete/presentation/screens/booking/booking_screen.dart';
import 'package:brechfete/presentation/screens/reservation/reservation_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  final pages = const [
    BookingScreen(),
    ReservationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: currentSelectedIndexNotifier,
          builder: (BuildContext context, int newSelectedIndex, Widget? _) {
            return pages[newSelectedIndex];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
