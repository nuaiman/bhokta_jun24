import 'core/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/auth/screens/landing_screen.dart';

void main() {
  runApp(const ProviderScope(child: BhoktaOdhikarConsumerApp()));
}

class BhoktaOdhikarConsumerApp extends StatelessWidget {
  const BhoktaOdhikarConsumerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bhokta Odhikar Consumer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppPalette.green),
        useMaterial3: true,
      ),
      home: const LandingScreen(),
    );
  }
}
