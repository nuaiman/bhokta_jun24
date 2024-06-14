import 'auth_sheet.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/palette.dart';
import '../../../core/constants/pngs.dart';
import '../widgets/landing_horizontal_cards.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(Pngs.building),
                  fit: BoxFit.fitHeight,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.colorBurn),
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(Pngs.logo),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'জাতীয় ভোক্তা-অধিকার\nসংরক্ষণ অধিদপ্তর',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'নির্দেশাবলী',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ),
                  LandingHorizontalCards(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Palette.white,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                barrierColor: Colors.transparent,
                isScrollControlled: true,
                useSafeArea: true,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: const AuthSheet(),
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'অভিযোগ দায়ের করুন',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
