import 'package:clock_app/utils/routes.dart';
import 'package:clock_app/view/screens/clock_page.dart';
import 'package:clock_app/view/screens/second_page.dart';
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
          Routes.home_page : (context) => const HomePage(),
          Routes.second_paqe : (context) => const SecondPage(),
          Routes.clock_page : (context) => const ClockPage(),
        },
      );
}
