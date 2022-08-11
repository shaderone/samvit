import 'package:brechfete/presentation/root/app.dart';
import 'package:brechfete/presentation/root/widgets/custom_theme.dart';
import 'package:flutter/material.dart';

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
          darkTheme: CustomTheme.darkTheme,
          home: const App(),
        );
      },
    );
  }
}
