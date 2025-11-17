import 'package:decorly/login.dart';
import 'package:decorly/signup.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/home.png', // Replace with your image path
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: decorlyBrown,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: const Text('Get Started'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
