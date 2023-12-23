import 'package:flutter/material.dart';
import 'package:timer_app/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            backgroundColor: const Color.fromARGB(255, 45, 60, 107),
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Color(0xFFF4EDDB),
            ),
          ),
          cardColor: const Color(0xFFF4EDDB),
        ),
        home: const HomeScreen());
  }
}
