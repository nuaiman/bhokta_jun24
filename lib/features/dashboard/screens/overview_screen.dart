import 'package:bhokta_consumer/core/constants/palette.dart';
import 'package:bhokta_consumer/core/constants/pngs.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          height: kToolbarHeight - 10,
          width: double.infinity,
          color: AppPalette.green.withOpacity(0.2),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(Pngs.logo),
                ),
                Text(
                  'DNCRP - CCMS',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Opacity(
                  opacity: 0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(Pngs.logo),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
