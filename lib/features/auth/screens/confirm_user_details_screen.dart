import 'dart:io';

import 'package:bhokta_consumer/core/constants/palette.dart';
import 'package:bhokta_consumer/core/widgets/rounded_outlined_button.dart';
import 'package:bhokta_consumer/features/auth/notifiers/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/notifiers/language_notifier.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import '../widgets/user_details_field.dart';

class ConfirmUserDetailsScreen extends ConsumerWidget {
  final File image;
  const ConfirmUserDetailsScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageProvider = ref.watch(appLanguageProvider);
    final userDetails = ref.read(userProvider);

    String getFirstHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Please confirm your';
        case AppLanguage.bangla:
          return 'আপনার ব্যক্তিগত তথ্য যাচাই';
      }
    }

    String getSecondHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'provided details';
        case AppLanguage.bangla:
          return 'করুন';
      }
    }

    String getFatherNameText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Father\'s name';
        case AppLanguage.bangla:
          return 'বাবার নাম';
      }
    }

    String getMotherNameText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Mother\'s name';
        case AppLanguage.bangla:
          return 'মায়ের নাম';
      }
    }

    String getBirthdateeText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Birth date';
        case AppLanguage.bangla:
          return 'জন্ম তারিখ';
      }
    }

    String getGenderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Gender';
        case AppLanguage.bangla:
          return 'লিঙ্গ';
      }
    }

    String getAddressText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Address';
        case AppLanguage.bangla:
          return 'ঠিকানা';
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

    String getDivisionText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Division';
        case AppLanguage.bangla:
          return 'বিভাগ';
      }
    }

    String getPostalCodeText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Postal Code';
        case AppLanguage.bangla:
          return 'ডাক নাম্বার';
      }
    }

    String getProfessionText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Profession';
        case AppLanguage.bangla:
          return 'পেশা';
      }
    }

    String getNIDText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'NID';
        case AppLanguage.bangla:
          return 'এন.আই.ডি';
      }
    }

    String getBirthIdText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Birth Certificate Number';
        case AppLanguage.bangla:
          return 'জন্ম শংসাপত্র নম্বর';
      }
    }

    String getPassportNumberText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Passport Number';
        case AppLanguage.bangla:
          return 'পাসপোর্ট নম্বর';
      }
    }

    String getEditText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return '< Edit';
        case AppLanguage.bangla:
          return '< এডিট';
      }
    }

    String getNextText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Continue';
        case AppLanguage.bangla:
          return 'পরবর্তী';
      }
    }

    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: kToolbarHeight + 40,
        title: Column(
          children: [
            Text(
              getFirstHeaderText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            Text(
              getSecondHeaderText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Pngs.logo),
            opacity: 0.05,
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: FileImage(image),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Text(
                          userDetails.fullName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  UserDetailsField(
                    label: getFatherNameText(),
                    value: userDetails.fatherName,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  UserDetailsField(
                    label: getMotherNameText(),
                    value: userDetails.motherName,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: UserDetailsField(
                          label: getBirthdateeText(),
                          value: DateFormat('d MMM yyyy')
                              .format(userDetails.birthDate),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        flex: 2,
                        child: UserDetailsField(
                          label: getGenderText(),
                          value: userDetails.gender,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  UserDetailsField(
                    label: getAddressText(),
                    value: userDetails.fullAddress,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: UserDetailsField(
                          label: getDistrictText(),
                          value: userDetails.district,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: UserDetailsField(
                          label: getDivisionText(),
                          value: userDetails.division,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: UserDetailsField(
                          label: getPostalCodeText(),
                          value: userDetails.postalCode,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: UserDetailsField(
                          label: getProfessionText(),
                          value: userDetails.profession,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  UserDetailsField(
                    label: getNIDText(),
                    value: userDetails.nidNumber,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  UserDetailsField(
                    label: getBirthIdText(),
                    value: userDetails.birthCertificateNumber,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  UserDetailsField(
                    label: getPassportNumberText(),
                    value: userDetails.passportNumber,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: RoundedOutlinedButton(
                label: getEditText(),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Expanded(
              child: RoundedElevatedButton(
                label: getNextText(),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
