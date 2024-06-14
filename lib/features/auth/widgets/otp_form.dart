import 'package:bhokta_consumer/core/utils/navigators.dart';
import 'package:bhokta_consumer/features/auth/notifiers/auth_mode_nitifier.dart';
import 'package:bhokta_consumer/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pinput/pinput.dart';

import '../../../core/constants/palette.dart';

class OtpForm extends ConsumerWidget {
  const OtpForm({
    super.key,
    required this.otpController,
  });
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Header
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // drag handle
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.25,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 4,
                    decoration: BoxDecoration(
                      color: Palette.green,
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(
                        color: Palette.green,
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
              // auth mode title
              const Text(
                'ওটিপি দিন',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'প্রেরিত ওটিপি নম্বর লিখুন',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
            ],
          ),
          //Auth fields
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Pinput(
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Palette.green,
                      fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    border: Border.all(color: Palette.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: otpController,
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  return value == '2222' ? null : 'Pin is incorrect';
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              OtpTimerButton(
                height: 60,
                onPressed: () {},
                text: const Text(
                  'ওটিপি আবার পাঠান',
                  style: TextStyle(fontSize: 16),
                ),
                buttonType: ButtonType.text_button,
                backgroundColor: const Color(0xFF212121),
                duration: 30,
              ),
            ],
          ),
          // actions
          Column(
            children: [
              Container(
                color: Palette.white,
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    navigateAndRemoveUntil(context, const HomeScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Palette.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'পরবর্তী',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(authModeProvider.notifier).goBack();
                    },
                    child: const Text(
                      'পেছনে',
                      style: TextStyle(
                        fontSize: 16,
                        color: Palette.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
