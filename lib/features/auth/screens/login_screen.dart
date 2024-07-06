import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/palette.dart';
import '../../../core/notifiers/language_notifier.dart';
import '../../../core/utils/navigators.dart';
import 'number_registration_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = ref.watch(appLanguageProvider);

    String getHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Please login';
        case AppLanguage.bangla:
          return 'লগইন করুন';
      }
    }

    String getEnterMobileText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Enter mobile number';
        case AppLanguage.bangla:
          return 'মোবাইল নাম্বার লিখুন';
      }
    }

    String getEnterPasswordText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Enter password';
        case AppLanguage.bangla:
          return 'পাসওয়ার্ড দিন';
      }
    }

    String getDidForgetPasswordText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Forgot password?';
        case AppLanguage.bangla:
          return 'পাসওয়ার্ড ভুলে গেছেন?';
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
              Text(
                getHeaderText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: getEnterMobileText(),
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: getEnterPasswordText(),
                        border: const OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        navigate(context, const NumberRegistrationScreen());
                      },
                      child: Text(
                        getDidForgetPasswordText(),
                        style: const TextStyle(
                          color: AppPalette.green,
                        ),
                      ),
                    ),
                  ],
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
            // navigate(context, const OtpScreen());
          },
        ),
      ),
    );
  }
}
