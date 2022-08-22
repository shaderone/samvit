import 'package:brechfete/presentation/root/splash_screen/splash_screen.dart';
import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
import 'package:brechfete/presentation/screens/bookings/pages/booking_success_page.dart';
import 'package:brechfete/presentation/screens/bookings/pages/pay_now_page.dart';
import 'package:brechfete/presentation/screens/reservations/reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/root/widgets/custom_theme.dart';
import 'package:brechfete/presentation/screens/login/login.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: CustomTheme.darkTheme.copyWith(
        splashColor: Colors.transparent,
      ), //change it later to splash screen
      //if already authenticated move to app directly
      home: const SplashScreen(),
      routes: {
        //login screen
        App.loginRoute: (context) => const LoginScreen(),
        //booking screen
        App.bookingsRoute: (context) => const BookingScreen(),
        //reservation screen
        App.reservationsRoute: (context) => const ReservationScreen(),
        //pay Later screen
        App.payNowRoute: (context) => const PayNowPage(),
        //booking success screen
        App.bookingSuccessRoute: (context) => const BookingSuccessPage(),
        //payments screen
        App.paymentsRoute: (context) => const LoginScreen(),
        //root screen
        App.home: (context) => const App(),
      },
      builder: EasyLoading.init(),
    );
  }
}
