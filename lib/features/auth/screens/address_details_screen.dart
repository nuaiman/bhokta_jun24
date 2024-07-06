import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/notifiers/language_notifier.dart';
import 'professional_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/utils/navigators.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class AddressDetailsScreen extends ConsumerStatefulWidget {
  const AddressDetailsScreen({super.key});

  @override
  ConsumerState<AddressDetailsScreen> createState() =>
      _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends ConsumerState<AddressDetailsScreen> {
  String? division;
  String? state;
  final addressController = TextEditingController();
  final postCodeController = TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    postCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = ref.watch(appLanguageProvider);

    String getHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Enter your address';
        case AppLanguage.bangla:
          return 'ঠিকানা প্রদান করুন';
      }
    }

    String getFullAddressText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Full address*';
        case AppLanguage.bangla:
          return 'সম্পুর্ণ ঠিকানা*';
      }
    }

    String getDhakaText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Dhaka';
        case AppLanguage.bangla:
          return 'ঢাকা';
      }
    }

    String getDivisionText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Division';
        case AppLanguage.bangla:
          return 'বিভাগ';
      }
    }

    String getDistrictText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'District';
        case AppLanguage.bangla:
          return 'জেলা';
      }
    }

    String getPostalCodeText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Postal code*';
        case AppLanguage.bangla:
          return 'পোস্টাল কোড*';
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
              children: [
                Text(
                  getHeaderText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: addressController,
                        decoration: InputDecoration(
                          hintText: getFullAddressText(),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16), // Reduced padding
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ExpansionTile(
                              dense: true,
                              tilePadding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              collapsedShape: const OutlineInputBorder(),
                              shape: const OutlineInputBorder(),
                              title: Text(
                                division == null
                                    ? getDivisionText()
                                    : division!,
                                style: const TextStyle(fontSize: 16),
                              ),
                              children: [
                                ListTile(
                                  title: Text(getDhakaText()),
                                  onTap: () {
                                    setState(() {
                                      division = 'dhaka';
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ExpansionTile(
                              dense: true,
                              tilePadding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              collapsedShape: const OutlineInputBorder(),
                              shape: const OutlineInputBorder(),
                              title: Text(
                                division == null
                                    ? getDistrictText()
                                    : division!,
                                style: const TextStyle(fontSize: 16),
                              ),
                              children: [
                                ListTile(
                                  title: Text(getDhakaText()),
                                  onTap: () {
                                    setState(() {
                                      division = 'dhaka';
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: postCodeController,
                        decoration: InputDecoration(
                          hintText: getPostalCodeText(),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
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
            navigate(context, const ProfessionalDetailsScreen());
          },
        ),
      ),
    );
  }
}
