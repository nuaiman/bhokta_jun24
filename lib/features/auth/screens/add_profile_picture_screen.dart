import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/notifiers/language_notifier.dart';
import '../../../core/widgets/rounded_outlined_button.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class AddProfilePictureScreen extends ConsumerStatefulWidget {
  const AddProfilePictureScreen({super.key});

  @override
  ConsumerState<AddProfilePictureScreen> createState() =>
      _AddProfilePictureScreenState();
}

class _AddProfilePictureScreenState
    extends ConsumerState<AddProfilePictureScreen> {
  String? dropdownvalue;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = ref.watch(appLanguageProvider);

    String getFirstHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Please add your';
        case AppLanguage.bangla:
          return 'প্রোফাইলের ছবি';
      }
    }

    String getSecondHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'profile picture';
        case AppLanguage.bangla:
          return 'যোগ করুন';
      }
    }

    String getCameraButtonText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Camera';
        case AppLanguage.bangla:
          return 'ছবি তুলুন';
      }
    }

    String getGalleryButtonText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Gallery';
        case AppLanguage.bangla:
          return 'আপলোড';
      }
    }

    String getNextText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Next';
        case AppLanguage.bangla:
          return 'পরবর্তী';
      }
    }

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
                Column(
                  children: [
                    Text(
                      getFirstHeaderText(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      getSecondHeaderText(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
                                label: getCameraButtonText(), onTap: () {}),
                          ),
                          Expanded(
                            child: RoundedElevatedButton(
                                label: getGalleryButtonText(), onTap: () {}),
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
          label: getNextText(),
          onTap: () {
            // navigate(context, const NationalDetailsScreen());
          },
        ),
      ),
    );
  }
}
