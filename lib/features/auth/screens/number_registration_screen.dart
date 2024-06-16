import '../../../core/utils/navigators.dart';
import 'otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class NumberRegistrationScreen extends StatefulWidget {
  const NumberRegistrationScreen({super.key});

  @override
  State<NumberRegistrationScreen> createState() =>
      _NumberRegistrationScreenState();
}

class _NumberRegistrationScreenState extends State<NumberRegistrationScreen> {
  final phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(Pngs.logo),
              ),
              const Column(
                children: [
                  Text(
                    'আপনার মোবাইল',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    'নাম্বার প্রদান করুন',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: 'মোবাইল নাম্বার লিখুন',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(),
              const SizedBox(),
              const SizedBox(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: RoundedElevatedButton(
          label: 'পরবর্তী',
          onTap: () {
            navigate(context, const OtpScreen());
          },
        ),
      ),
    );
  }
}
