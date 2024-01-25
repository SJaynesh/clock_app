import 'package:flutter/material.dart';
import 'package:clock_app/view/screens/home_page.dart';

void main() {
  runApp(
    const ClockApp(),
  );
}

class ClockApp extends StatelessWidget {
  const ClockApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/' : (context) => const HomePage(),
        },
      );
}
