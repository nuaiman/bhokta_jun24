import 'package:bhokta_consumer/core/utils/navigators.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import '../../../core/widgets/rounded_outlined_button.dart';
import 'number_registration_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(Pngs.logo),
          ),
          const Text(
            'জাতীয় ভোক্তা অধিকার সংরক্ষন অধিদপ্তর',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          Column(
            children: [
              RoundedElevatedButton(
                label: 'শুরু করুন',
                onTap: () {
                  navigate(context, const NumberRegistrationScreen());
                },
              ),
              const SizedBox(height: 8),
              const Text('—————   অথবা   —————'),
              const Text('ইতঃমধ্যে রেজিস্ট্রেশন করেছেন?'),
              const SizedBox(height: 8),
              RoundedOutlinedButton(
                label: 'শুরু করুন',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
