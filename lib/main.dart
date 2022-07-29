import 'package:asset_people_application/core/data/app_shared_prefs.dart';
import 'package:asset_people_application/core/injections.dart';
import 'package:asset_people_application/screens/calender_day_screen.dart';
import 'package:asset_people_application/screens/home_screen.dart';
import 'package:asset_people_application/screens/login_screen.dart';
import 'package:asset_people_application/screens/welcome_screen.dart';

import 'package:asset_people_application/screens/calender_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AssetPeople",
      theme: ThemeData(
        primaryColor: const Color(0xff0d5076),
      ),
      initialRoute: sl<AppSharedPrefs>().getUserId() != null && sl<AppSharedPrefs>().getUserId() != '' ? "HomeScreen" : "WelcomeScreen",
      routes: {
        "WelcomeScreen": (context) => const WelcomeScreen(),
        "HomeScreen": (context) => const HomeScreen(),
        "LoginScreen": (context) => const LoginScreen(),
        "CalenderScreen": (context) => const CalenderScreen(),
        "CalenderDayScreen": (context) => const CalenderDayScreen(),
      },
    );
  }
}
