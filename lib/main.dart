import 'package:brechfete/presentation/screens/bookings/booking_screen.dart';
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
      initialRoute: App.loginRoute,
      routes: {
        //login screen
        App.loginRoute: (context) => const LoginScreen(),
        //root screen
        App.home: (context) => const App(),
      },
      builder: EasyLoading.init(),
    );
  }
}
