import 'package:bhokta_consumer/features/auth/notifiers/auth_mode_nitifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/palette.dart';
import 'auth_field.dart';

class LoginForm extends ConsumerWidget {
  LoginForm({
    super.key,
    required this.phoneController,
    required this.passwordController,
  });
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  final _formKey = GlobalKey<FormState>();

  void submit(WidgetRef ref) {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    ref.read(authModeProvider.notifier).changeToOtpMode(AuthMode.login);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Header
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
                  'লগইন করুন',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'পরবর্তী যেতে দয়া করে সমস্ত বিবরণ লিখুন',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            //Auth fields
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                AuthField(
                  controller: phoneController,
                  labelText: 'ফোন নম্বর',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 11) {
                      return 'আপনার বৈধ ফোন নম্বর লিখুন';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                AuthField(
                  controller: passwordController,
                  labelText: 'পাসওয়ার্ড',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'পাসওয়ার্ড লিখুন';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
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
                    onPressed: () => submit(ref),
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(authModeProvider.notifier)
                            .changeAuthMode(AuthMode.registration);
                      },
                      child: const Text(
                        'রেজিস্ট্রেশন করুন',
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
      ),
    );
  }
}
