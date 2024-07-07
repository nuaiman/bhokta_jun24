import 'package:bhokta_consumer/core/notifiers/language_notifier.dart';
import 'package:bhokta_consumer/core/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/navigators.dart';
import '../../../models/auth.dart';
import '../screens/new_password_screen.dart';
import '../screens/otp_screen.dart';
import '../screens/personal_details_screen.dart';

class AuthNotifier extends StateNotifier<Auth> {
  AuthNotifier()
      : super(Auth(uId: '', jwt: '', email: '', phone: '', password: ''));

  void addPhoneNumber(
      BuildContext context, AppLanguage language, String mobileNumber) {
    if (mobileNumber.length < 11) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'অচল ফোন নম্বর'
            : 'Invalid phone number',
      );
      return;
    }
    state = state.copyWith(phone: mobileNumber);
    navigate(context, const OtpScreen());
  }

  void verifyOTP(BuildContext context, AppLanguage language, String otp) {
    if (otp.length < 6) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'অচল ওটিপি নম্বর'
            : 'Invalid OTP number',
      );
      return;
    }
    navigate(context, const NewPasswordScreen());
  }

  void addNewPassword(BuildContext context, AppLanguage language,
      String password, String confirmPassword) {
    if (password != confirmPassword) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'পাসওয়ার্ড মিলছে না'
            : 'Passwords are mismatching',
      );
      return;
    }
    state = state.copyWith(password: password);
    navigate(context, const PersonalDetailsScreen());
  }
}
// -----------------------------------------------------------------------------

final authProvider = StateNotifierProvider<AuthNotifier, Auth>((ref) {
  return AuthNotifier();
});
