import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/notifiers/language_notifier.dart';
import '../../../core/utils/navigators.dart';
import '../../../core/utils/snackbar.dart';
import '../../../models/user.dart';
import '../screens/add_profile_picture_screen.dart';
import '../screens/address_details_screen.dart';
import '../screens/confirm_user_details_screen.dart';
import '../screens/national_details_screen.dart';
import '../screens/professional_details_screen.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(
          User(
            id: '',
            fullName: '',
            profileUrl: '',
            fatherName: '',
            motherName: '',
            birthDate: DateTime(1920),
            gender: '',
            profession: '',
            nidNumber: '',
            passportNumber: '',
            birthCertificateNumber: '',
            fullAddress: '',
            division: '',
            district: '',
            postalCode: '',
            complains: [],
            agreedToTermsAndConditions: false,
          ),
        );

  void addPersonalDetails(
    BuildContext context,
    AppLanguage language,
    String fullName,
    String fathername,
    String motherName,
    String? gender,
    DateTime? birthDate,
  ) {
    if (gender == null) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'আপনার লিঙ্গ কি?'
            : 'What is your gender?',
      );
      return;
    } else if (birthDate == null || birthDate.isBefore(DateTime(1921))) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'সঠিক জন্ম তারিখ লিখুন'
            : 'Enter correct birth date',
      );
      return;
    } else if (fullName.isEmpty) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'আপনার সম্পূর্ণ নাম লিখুন'
            : 'Please enter your full name',
      );
      return;
    } else if (fathername.isEmpty) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'আপনার বাবার নাম লিখুন'
            : 'Please enter your father\'s name',
      );
      return;
    } else if (motherName.isEmpty) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'আপনার মায়ের নাম লিখুন'
            : 'Please enter your mother\'s name',
      );
      return;
    }
    state = state.copyWith(
      fullName: fullName,
      fatherName: fathername,
      motherName: motherName,
      gender: gender,
      birthDate: birthDate,
    );
    navigate(context, const NationalDetailsScreen());
  }

  void addNationalDetails(
    BuildContext context,
    AppLanguage language,
    String nidNumber,
    String passportNumber,
    String birthCertificateNumber,
  ) {
    if (nidNumber.length < 8) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'অনুগ্রহ করে আপনার এন.আই.ডি নম্বর লিখুন'
            : 'Please enter your NID number',
      );
      return;
    }
    state = state.copyWith(
      nidNumber: nidNumber,
      passportNumber: passportNumber,
      birthCertificateNumber: birthCertificateNumber,
    );
    navigate(context, const AddressDetailsScreen());
  }

  void addAddressDetails(
    BuildContext context,
    AppLanguage language,
    String fullAddress,
    String? division,
    String? district,
    String postalCode,
  ) {
    if (fullAddress.isEmpty) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'আপনার ঠিকানা লিখুন'
            : 'Please enter your address',
      );
      return;
    } else if (division == null) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'আপনার বিভাগ নির্বাচন করুন'
            : 'Please choose your division',
      );
      return;
    } else if (district == null) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'আপনার জেলা নির্বাচন করুন'
            : 'Please choose your district',
      );
      return;
    } else if (postalCode.isEmpty || postalCode.length < 4) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'আপনার পোস্টাল কোড দিন'
            : 'Please enter your postal code',
      );
      return;
    }
    state = state.copyWith(
      fullAddress: fullAddress,
      division: division,
      district: district,
      postalCode: postalCode,
    );
    navigate(context, const ProfessionalDetailsScreen());
  }

  void addProfessionDetails(
      BuildContext context, AppLanguage language, String? profession) {
    if (profession == null || profession.isEmpty) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'তোমার পেশা কি?'
            : 'What is your profession?',
      );
      return;
    }
    state = state.copyWith(profession: profession);
    navigate(context, const AddProfilePictureScreen());
  }

  void addProfileImage(
      BuildContext context, AppLanguage language, File? image) {
    if (image == null) {
      showSnackbar(
        context,
        language == AppLanguage.bangla
            ? 'আপনার প্রোফাইল ছবি যোগ করুন'
            : 'Please add your profile picture',
      );
      return;
    }
    state = state.copyWith(profileUrl: image.path);
    navigate(context, ConfirmUserDetailsScreen(image: image));
  }
}
// -----------------------------------------------------------------------------

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});
