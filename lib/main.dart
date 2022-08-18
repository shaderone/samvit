import 'package:flutter/material.dart';
import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/root/widgets/custom_theme.dart';
import 'package:brechfete/presentation/screens/login/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
      ),
      initialRoute: '/login', //change it later to splash screen
      routes: {
        //login screen
        App.loginRoute: (context) => const LoginScreen(),
        //root screen
        App.home: (context) => const App(),
      },
    );
  }
}
