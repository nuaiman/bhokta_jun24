import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/notifiers/language_notifier.dart';
import '../../../core/utils/navigators.dart';
import 'login_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import '../../../core/widgets/rounded_outlined_button.dart';
import 'number_registration_screen.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageProvider = ref.watch(appLanguageProvider);

    String getHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'National Directorate of Consumer Protection';
        case AppLanguage.bangla:
          return 'জাতীয় ভোক্তা অধিকার সংরক্ষন অধিদপ্তর';
      }
    }

    String getRegistrationText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Register';
        case AppLanguage.bangla:
          return 'রেজিস্ট্রেশন';
      }
    }

    String getElseText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return '————— Or —————';
        case AppLanguage.bangla:
          return '—————   অথবা   —————';
      }
    }

    String getAlreadyRegisteredText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Already registered?';
        case AppLanguage.bangla:
          return 'ইতঃমধ্যে রেজিস্ট্রেশন করেছেন?';
      }
    }

    String getLoginText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'login';
        case AppLanguage.bangla:
          return 'লগইন';
      }
    }

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
          Text(
            getHeaderText(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
            ),
          ),
          Column(
            children: [
              RoundedElevatedButton(
                label: getRegistrationText(),
                onTap: () {
                  navigate(context, const NumberRegistrationScreen());
                },
              ),
              const SizedBox(height: 8),
              Text(getElseText()),
              Text(getAlreadyRegisteredText()),
              const SizedBox(height: 8),
              RoundedOutlinedButton(
                label: getLoginText(),
                onTap: () {
                  navigate(context, const LoginScreen());
                },
              ),
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
