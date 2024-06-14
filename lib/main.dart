import 'package:bhokta_consumer/core/constants/palette.dart';
import 'package:bhokta_consumer/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Palette.green),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
