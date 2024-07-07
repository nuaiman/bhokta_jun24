import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/notifiers/language_notifier.dart';
import '../../../core/utils/navigators.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import 'personal_details_screen.dart';

class NewPasswordScreen extends ConsumerStatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  ConsumerState<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends ConsumerState<NewPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
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
          return 'আপনার পাসওয়ার্ড';
      }
    }

    String getSecondHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'password';
        case AppLanguage.bangla:
          return 'প্রদান করুন';
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

    String getConfirmPasswordText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Confirm password';
        case AppLanguage.bangla:
          return 'পাসওয়ার্ড নিশ্চিত করুন';
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: getEnterPasswordText(),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: getConfirmPasswordText(),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
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
            navigate(context, const PersonalDetailsScreen());
          },
        ),
      ),
    );
  }
}
