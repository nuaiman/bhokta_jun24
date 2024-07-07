import 'package:bhokta_consumer/features/auth/notifiers/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/palette.dart';
import '../../../core/notifiers/language_notifier.dart';
import 'address_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/utils/navigators.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class NationalDetailsScreen extends ConsumerStatefulWidget {
  const NationalDetailsScreen({super.key});

  @override
  ConsumerState<NationalDetailsScreen> createState() =>
      _NationalDetailsScreenState();
}

class _NationalDetailsScreenState extends ConsumerState<NationalDetailsScreen> {
  final nidController = TextEditingController();
  final birthIdController = TextEditingController();
  final passportIdController = TextEditingController();

  @override
  void dispose() {
    nidController.dispose();
    birthIdController.dispose();
    passportIdController.dispose();
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
          return 'পরিচয় তথ্য প্রদান';
      }
    }

    String getSecondHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'personal details';
        case AppLanguage.bangla:
          return 'করুন';
      }
    }

    String getAddIdentityInformationHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Select identity information';
        case AppLanguage.bangla:
          return 'পরিচয় তথ্য নির্বাচন';
      }
    }

    String getNidNumberText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'N.I.D number *';
        case AppLanguage.bangla:
          return 'জাতীয় পরিচয় পত্রের নাম্বার *';
      }
    }

    String getBirthCertificateNumbereText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Birth certificate number';
        case AppLanguage.bangla:
          return 'জন্মনিবন্ধন সনদের নাম্বার';
      }
    }

    String getPassportNumbereText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Passport number';
        case AppLanguage.bangla:
          return 'পাসপোর্টের নাম্বার';
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

    void addNationalDetails(
      BuildContext context,
      AppLanguage language,
      String nidNumber,
      String passportNumber,
      String birthCertificateNumber,
    ) {
      ref.read(userProvider.notifier).addNationalDetails(
            context,
            language,
            nidNumber,
            passportNumber,
            birthCertificateNumber,
          );
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
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: getAddIdentityInformationHeaderText(),
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ),
                        const Divider(color: AppPalette.black),
                        TextField(
                          controller: nidController,
                          decoration: InputDecoration(
                            hintText: getNidNumberText(),
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const Divider(color: AppPalette.black),
                        TextField(
                          controller: birthIdController,
                          decoration: InputDecoration(
                            hintText: getBirthCertificateNumbereText(),
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const Divider(color: AppPalette.black),
                        TextField(
                          controller: passportIdController,
                          decoration: InputDecoration(
                            hintText: getPassportNumbereText(),
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
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
          onTap: () => addNationalDetails(
            context,
            languageProvider,
            nidController.text.trim().isNotEmpty
                ? nidController.text.trim()
                : '',
            passportIdController.text.trim().isNotEmpty
                ? passportIdController.text.trim()
                : '',
            birthIdController.text.trim().isNotEmpty
                ? birthIdController.text.trim()
                : '',
          ),
        ),
      ),
    );
  }
}
