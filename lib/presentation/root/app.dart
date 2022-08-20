import 'package:brechfete/presentation/root/widgets/bottom_navbar.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:brechfete/presentation/screens/payments/payment_history_screen.dart';
import 'package:brechfete/presentation/screens/reservations/reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const String loginRoute = "login";
  static const String home = "home";

  final pages = const [
    BookingScreen(),
    ReservationScreen(),
    PaymentHistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        elevation: 0,
        toolbarHeight: 10,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: MaterialBottomNav.currentSelectedIndexNotifier,
          builder: (BuildContext context, int newSelectedIndex, Widget? _) {
            return pages[newSelectedIndex];
          },
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 70,
        child: MaterialBottomNav(),
      ),
    );
  }
}
