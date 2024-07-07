import 'package:bhokta_consumer/features/auth/notifiers/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/notifiers/language_notifier.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class ProfessionalDetailsScreen extends ConsumerStatefulWidget {
  const ProfessionalDetailsScreen({super.key});

  @override
  ConsumerState<ProfessionalDetailsScreen> createState() =>
      _ProfessionalDetailsScreenState();
}

class _ProfessionalDetailsScreenState
    extends ConsumerState<ProfessionalDetailsScreen> {
  String? profession;

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
          return 'Please enter your';
        case AppLanguage.bangla:
          return 'পেশাগত তথ্য প্রদান';
      }
    }

    String getSecondHeaderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'professional details';
        case AppLanguage.bangla:
          return 'করুন';
      }
    }

    String getIAmAText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'I am a ';
        case AppLanguage.bangla:
          return 'আমি একজন ';
      }
    }

    String getTeacherText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Teacher';
        case AppLanguage.bangla:
          return 'শিক্ষার্থী';
      }
    }

    String getBusinessmanText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Business person';
        case AppLanguage.bangla:
          return 'ব্যবসায়ী';
      }
    }

    String getServiceholderText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Service-holder';
        case AppLanguage.bangla:
          return 'চাকুরীজীবী';
      }
    }

    String getHouseWifeText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'House wife';
        case AppLanguage.bangla:
          return 'গৃহিণী';
      }
    }

    String getFarmerText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Farmer';
        case AppLanguage.bangla:
          return 'কৃষক';
      }
    }

    String getOtherProfessionText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Others';
        case AppLanguage.bangla:
          return 'অন্যান্য';
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

    void addProfessionDetails(
        BuildContext context, AppLanguage language, String? profession) {
      ref
          .read(userProvider.notifier)
          .addProfessionDetails(context, language, profession);
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
                  child: ExpansionTile(
                    dense: true,
                    tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                    collapsedShape: const OutlineInputBorder(),
                    shape: const OutlineInputBorder(),
                    title: Text(
                      profession == null ? getIAmAText() : profession!,
                      style: const TextStyle(fontSize: 16),
                    ),
                    children: [
                      ListTile(
                        title: Text(getTeacherText()),
                        onTap: () {
                          setState(() {
                            profession = 'teacher';
                          });
                        },
                      ),
                      ListTile(
                        title: Text(getBusinessmanText()),
                        onTap: () {
                          setState(() {
                            profession = 'business';
                          });
                        },
                      ),
                      ListTile(
                        title: Text(getServiceholderText()),
                        onTap: () {
                          setState(() {
                            profession = 'serviceholder';
                          });
                        },
                      ),
                      ListTile(
                        title: Text(getHouseWifeText()),
                        onTap: () {
                          setState(() {
                            profession = 'housewife';
                          });
                        },
                      ),
                      ListTile(
                        title: Text(getFarmerText()),
                        onTap: () {
                          setState(() {
                            profession = 'farmer';
                          });
                        },
                      ),
                      ListTile(
                        title: Text(getOtherProfessionText()),
                        onTap: () {
                          setState(() {
                            profession = 'others';
                          });
                        },
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
          onTap: () => addProfessionDetails(
            context,
            languageProvider,
            profession,
          ),
        ),
      ),
    );
  }
}
