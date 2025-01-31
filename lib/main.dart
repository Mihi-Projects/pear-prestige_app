import 'package:ecom_app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pearl & Prestige',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          headlineMedium:
              TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
          bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
          labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        scaffoldBackgroundColor: Colors.grey[50],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepOrange[800],
          unselectedItemColor: Colors.grey[600],
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          headlineMedium:
              TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
          bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
          labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 26, 26, 26),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.deepOrange[800],
          unselectedItemColor: Colors.white70,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
