import 'package:animations/animations.dart';
import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/widgets/bottom_navbar.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:brechfete/presentation/screens/payments/payment_history_screen.dart';
import 'package:brechfete/presentation/screens/reservations/reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  static const String loginRoute = "login";
  static const String bookingsRoute = "bookings";
  static const String reservationsRoute = "reservations";
  static const String payNowRoute = "payNowPage";
  static const String bookingSuccessRoute = "bookingSuccessPage";
  static const String paymentsRoute = "payments";
  static const String home = "home";

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final pages = const [
    BookingScreen(),
    ReservationScreen(),
    PaymentHistoryScreen(),
  ];

  DateTime currentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final clickTimeDifference = DateTime.now().difference(currentTime);
        final showExitWarning =
            clickTimeDifference >= const Duration(seconds: 1);

        currentTime = DateTime.now();
        if (showExitWarning) {
          Fluttertoast.showToast(
              msg: "Double tap to exit", toastLength: Toast.LENGTH_SHORT);
          await Future.delayed(const Duration(milliseconds: 500));
          Fluttertoast.cancel();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: bgDark,
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
              //to hide time and slot info on page switch
              BookingScreen.isDateSelectedNotifier.value = false;
              BookingScreen.isTimeSelectedNotifier.value = false;
              return PageTransitionSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) {
                  return FadeThroughTransition(
                    fillColor: bgDark,
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                child: pages[newSelectedIndex],
              );
            },
          ),
        ),
        bottomNavigationBar: const SizedBox(
          height: 70,
          child: MaterialBottomNav(),
        ),
      ),
    );
  }
}
