import 'package:flutter/material.dart';
import '../../../core/constants/palette.dart';
import '../../../models/landing_card_info.dart';

class LandingCustomCard extends StatelessWidget {
  final LandingCardInfo card;
  const LandingCustomCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Palette.white,
      elevation: 5,
      child: Container(
        width: 300,
        height: 200,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              card.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(card.content),
          ],
        ),
      ),
    );
  }
}
