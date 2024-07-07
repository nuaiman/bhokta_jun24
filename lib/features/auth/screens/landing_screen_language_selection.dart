import 'package:bhokta_consumer/features/auth/screens/landing_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/palette.dart';
import '../../../core/constants/pngs.dart';
import '../../../core/notifiers/language_notifier.dart';
import '../../../core/utils/navigators.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import 'package:flutter/material.dart';

class LandingScreenLanguageSelection extends ConsumerWidget {
  const LandingScreenLanguageSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageProvider = ref.watch(appLanguageProvider);

    String getWelcomeText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Welcome to the official application of National Directorate of Consumer Protection';
        case AppLanguage.bangla:
          return 'জাতীয় ভোক্তা অধিকার সংরক্ষন অধিদপ্তরে অফিসিয়াল এপ্লিকেশনে আপনাকে স্বাগতম';
      }
    }

    String getButtonText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Proceed';
        case AppLanguage.bangla:
          return 'শুরু করুন';
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
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
                  const Spacer(),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(Pngs.logo),
                  ),
                  const Spacer(),
                  const Column(
                    children: [
                      Text(
                        'ভাষা নির্বাচন করুন',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Choose Language',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LanguageCard(
                  label: 'English',
                  selectedLanguage: AppLanguage.english,
                  onTap: () {
                    ref
                        .read(appLanguageProvider.notifier)
                        .changeLanguage(AppLanguage.english);
                  },
                ),
                LanguageCard(
                  label: 'বাংলা',
                  selectedLanguage: AppLanguage.bangla,
                  onTap: () {
                    ref
                        .read(appLanguageProvider.notifier)
                        .changeLanguage(AppLanguage.bangla);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: RoundedElevatedButton(
          label: getButtonText(),
          bgColor: AppPalette.green,
          textColor: AppPalette.white,
          onTap: () {
            navigateAndRemoveUntil(
              context,
              const LandingScreen(),
            );
          },
        ),
      ),
    );
  }
}

class LanguageCard extends ConsumerWidget {
  final String label;
  final AppLanguage selectedLanguage;
  final VoidCallback onTap;
  const LanguageCard({
    super.key,
    required this.label,
    required this.selectedLanguage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLanguage = ref.watch(appLanguageProvider);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.48,
        decoration: BoxDecoration(
          border: Border.all(
              color: appLanguage == selectedLanguage
                  ? AppPalette.green
                  : AppPalette.black,
              width: appLanguage == selectedLanguage ? 3 : 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 28,
              color: appLanguage == selectedLanguage
                  ? AppPalette.green
                  : AppPalette.black,
            ),
          ),
        ),
      ),
    );
  }
}
