import 'package:brechfete/core/constants.dart';
import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/screens/login/login.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<Widget> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    await Future.delayed(const Duration(seconds: 1));
    return Future.value(token != null ? const App() : const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/samvit_logo.png',
        width: 200,
        height: 200,
      ),
      title: const Text(
        "Samwit 2.0",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: bgDark,
      showLoader: true,
      loadingText: const Text("Loading..."),
      futureNavigator: getToken(),
      loaderColor: pureWhite,
    );
  }
}
