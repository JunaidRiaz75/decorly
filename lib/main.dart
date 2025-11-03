/* import 'package:decorly/getstarted.dart';
import 'package:decorly/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcome', // Start with welcome screen
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/signin': (context) => GetStartedPage(),
        '/home': (context) => DecorlyHome(),
      },
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/signin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/decorly.png', width: 150, height: 150),
            SizedBox(height: 24),
            Text(
              'Decorly',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD2691E),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Designing your perfect space',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
 */

import 'package:decorly/favouritescreen.dart';
import 'package:decorly/home1.dart';
import 'package:decorly/listingscreen.dart';
import 'package:decorly/profilescreen.dart';
import 'package:decorly/realestateapp.dart';
import 'package:flutter/material.dart';
// make sure this path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0D1321),
        scaffoldBackgroundColor: const Color(0xFF0D1321),
        fontFamily: 'Poppins', // optional: gives a modern look
      ),
      home: const Realestateapp(),
    );
  }
}
