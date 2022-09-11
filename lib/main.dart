import 'package:samvit/bloc/booking/booking_bloc.dart';
import 'package:samvit/bloc/payment/payment_bloc.dart';
import 'package:samvit/bloc/paynow/paynow_bloc.dart';
import 'package:samvit/bloc/reservation/reservation_bloc.dart';
import 'package:samvit/bloc/slot_info/slot_info_bloc.dart';
import 'package:samvit/domain/core/di/injectable.dart';
import 'package:samvit/presentation/root/splash_screen/splash_screen.dart';
import 'package:samvit/presentation/screens/bookings/booking_screen.dart';
import 'package:samvit/presentation/screens/bookings/pages/booking_success_page.dart';
import 'package:samvit/presentation/screens/bookings/pages/pay_now_page.dart';
import 'package:samvit/presentation/screens/reservations/reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:samvit/presentation/root/app.dart';
import 'package:samvit/presentation/root/widgets/custom_theme.dart';
import 'package:samvit/presentation/screens/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<BookingBloc>()),
        BlocProvider(create: (context) => getIt<SlotInfoBloc>()),
        BlocProvider(create: (context) => getIt<ReservationBloc>()),
        BlocProvider(create: (context) => getIt<PaynowBloc>()),
        BlocProvider(create: (context) => getIt<PaymentBloc>()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
