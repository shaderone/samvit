import 'package:flutter/material.dart';
import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/root/widgets/custom_theme.dart';
import 'package:brechfete/presentation/screens/initial/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          //theme: CustomTheme.lightTheme, //later
          darkTheme: CustomTheme.darkTheme.copyWith(
            splashColor: Colors.transparent,
          ),
          initialRoute: '/login', //change it later to splash screen
          //home: const App(), // initial route is defined
          routes: {
            //login screen
            App.loginRoute: (context) => const LoginScreen(),
            //root screen
            App.home: (context) => const App(),
          },
        );
      },
    );
  }
}
