import 'package:bhokta_consumer/features/auth/notifiers/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/notifiers/language_notifier.dart';
import 'package:flutter/material.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pinput/pinput.dart';

import '../../../core/constants/palette.dart';
import '../../../core/constants/pngs.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = ref.watch(appLanguageProvider);

    String getFirstHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Enter OTP number';
        case AppLanguage.bangla:
          return 'OTP প্রদান করুন';
      }
    }

    String getErrorPinText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Pin is incorrect';
        case AppLanguage.bangla:
          return 'পিনটি ভুল';
      }
    }

    String getResendOtpText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'resend OTP';
        case AppLanguage.bangla:
          return 'ওটিপি আবার পাঠান';
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

    void verifyOTP(BuildContext context, AppLanguage language, String otp) {
      ref.read(authProvider.notifier).verifyOTP(context, language, otp);
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
                getFirstHeaderText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Pinput(
                      length: 6,
                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: AppPalette.black,
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppPalette.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      preFilledWidget: const Text(
                        '✶',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                      ),
                      controller: otpController,
                      separatorBuilder: (index) => const SizedBox(width: 8),
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                    ),
                    const SizedBox(height: 20),
                    OtpTimerButton(
                      height: 60,
                      onPressed: () {},
                      text: Text(
                        getResendOtpText(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      buttonType: ButtonType.text_button,
                      backgroundColor: const Color(0xFF212121),
                      duration: 120,
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
          onTap: () => verifyOTP(
            context,
            languageProvider,
            otpController.text.trim(),
          ),
        ),
      ),
    );
  }
}
