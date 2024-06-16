import '../../../core/widgets/rounded_outlined_button.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class AddProfilePictureScreen extends StatefulWidget {
  const AddProfilePictureScreen({super.key});

  @override
  State<AddProfilePictureScreen> createState() =>
      _AddProfilePictureScreenState();
}

class _AddProfilePictureScreenState extends State<AddProfilePictureScreen> {
  String? dropdownvalue;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Pngs.logo),
            opacity: 0.05,
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  children: [
                    Text(
                      'প্রোফাইলের ছবি',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'যোগ করুন',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 80,
                        child: Icon(
                          Icons.person_2_outlined,
                          size: 60,
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundedOutlinedButton(
                                label: 'ছবি তুলুন', onTap: () {}),
                          ),
                          Expanded(
                            child: RoundedElevatedButton(
                                label: 'আপলোড', onTap: () {}),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(),
                const SizedBox(),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: RoundedElevatedButton(
          label: 'পরবর্তী',
          onTap: () {
            // navigate(context, const NationalDetailsScreen());
          },
        ),
      ),
    );
  }
}
