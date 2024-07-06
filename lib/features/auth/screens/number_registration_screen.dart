import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/notifiers/language_notifier.dart';
import '../../../core/utils/navigators.dart';
import 'otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class NumberRegistrationScreen extends ConsumerStatefulWidget {
  const NumberRegistrationScreen({super.key});

  @override
  ConsumerState<NumberRegistrationScreen> createState() =>
      _NumberRegistrationScreenState();
}

class _NumberRegistrationScreenState
    extends ConsumerState<NumberRegistrationScreen> {
  final phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = ref.watch(appLanguageProvider);

    String getFirstHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Please add your';
        case AppLanguage.bangla:
          return 'আপনার মোবাইল';
      }
    }

    String getSecondHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'phone number';
        case AppLanguage.bangla:
          return 'নাম্বার প্রদান করুন';
      }
    }

    String getEnterMobileNumberText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Enter phone number';
        case AppLanguage.bangla:
          return 'মোবাইল নাম্বার লিখুন';
      }
    }

    String getNextText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Next';
        case AppLanguage.bangla:
          return 'পরবর্তী';
      }
    }

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
              Column(
                children: [
                  Text(
                    getFirstHeaderText(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    getSecondHeaderText(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: getEnterMobileNumberText(),
                    border: const OutlineInputBorder(),
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
          label: getNextText(),
          onTap: () {
            navigate(context, const OtpScreen());
          },
        ),
      ),
    );
  }
}
