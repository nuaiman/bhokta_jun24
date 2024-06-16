import 'package:bhokta_consumer/core/constants/palette.dart';
import 'package:bhokta_consumer/core/constants/pngs.dart';
import 'package:bhokta_consumer/core/utils/navigators.dart';
import 'package:bhokta_consumer/core/widgets/rounded_elevated_button.dart';
import 'package:flutter/material.dart';

import 'auth_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.shade600,
              Colors.green.shade900,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'জাতীয় ভোক্তা অধিকার সংরক্ষন অধিদপ্তরে অফিসিয়াল এপ্লিকেশনে আপনাকে স্বাগতম',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(Pngs.logo),
              ),
              const Text(
                'CCMS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: RoundedElevatedButton(
          label: 'শুরু করুন',
          bgColor: Palette.white,
          textColor: Palette.black,
          onTap: () {
            navigate(
              context,
              const AuthScreen(),
            );
          },
        ),
      ),
    );
  }
}
