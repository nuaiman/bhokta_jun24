import 'package:bhokta_consumer/features/auth/notifiers/auth_mode_nitifier.dart';
import 'package:bhokta_consumer/features/auth/widgets/otp_form.dart';
import 'package:bhokta_consumer/features/auth/widgets/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/palette.dart';
import '../widgets/login_form.dart';

class AuthSheet extends ConsumerStatefulWidget {
  const AuthSheet({super.key});

  @override
  ConsumerState<AuthSheet> createState() => _AuthSheetState();
}

class _AuthSheetState extends ConsumerState<AuthSheet> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nidController = TextEditingController();
  final otpController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nidController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authMode = ref.watch(authModeProvider);
    return Container(
      height: authMode == AuthMode.login
          ? 420
          : authMode == AuthMode.registration
              ? 600
              : 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Palette.white,
          width: 0.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: authMode == AuthMode.login
              ? LoginForm(
                  phoneController: phoneController,
                  passwordController: passwordController,
                )
              : authMode == AuthMode.registration
                  ? RegistrationForm(
                      nameController: nameController,
                      phoneController: phoneController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                      nidController: nidController,
                    )
                  : OtpForm(
                      otpController: otpController,
                    ),
        ),
      ),
    );
  }
}
