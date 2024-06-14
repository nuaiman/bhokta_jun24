import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthMode {
  login,
  registration,
  otp,
}

class AuthModeNotifier extends StateNotifier<AuthMode> {
  AuthModeNotifier() : super(AuthMode.login);

  AuthMode? previousAuthMode;

  void changeAuthMode(AuthMode authMode) {
    state = authMode;
  }

  void changeToOtpMode(AuthMode currentAuthMode) {
    previousAuthMode = currentAuthMode;
    state = AuthMode.otp;
  }

  void goBack() {
    state = previousAuthMode!;
  }
}
// -----------------------------------------------------------------------------

final authModeProvider =
    StateNotifierProvider<AuthModeNotifier, AuthMode>((ref) {
  return AuthModeNotifier();
});
