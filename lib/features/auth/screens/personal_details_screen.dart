import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../../core/notifiers/language_notifier.dart';
import 'national_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/utils/navigators.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class PersonalDetailsScreen extends ConsumerStatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  ConsumerState<PersonalDetailsScreen> createState() =>
      _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends ConsumerState<PersonalDetailsScreen> {
  String? dropdownvalue;
  DateTime? birthDate;
  final nameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final motherNameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
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
          return 'ব্যাক্তিগত তথ্য প্রদান';
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

    String getYourNameText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Full name';
        case AppLanguage.bangla:
          return 'আপনার নাম';
      }
    }

    String getFatherNameText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Full father\'s name';
        case AppLanguage.bangla:
          return 'আপনার পিতার নাম';
      }
    }

    String getMotherNameText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Full mother\'s name';
        case AppLanguage.bangla:
          return 'আপনার মায়ের নাম';
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

    String getMaleText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Male';
        case AppLanguage.bangla:
          return 'পুরুষ';
      }
    }

    String getFemaleText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Female';
        case AppLanguage.bangla:
          return 'নারী';
      }
    }

    String getOthersText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Others';
        case AppLanguage.bangla:
          return 'অন্যান্য';
      }
    }

    String getBirthDateText() {
      switch (languageProvider) {
        case AppLanguage.english:
          return 'Birth date*';
        case AppLanguage.bangla:
          return 'জন্ম তারিখ*';
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: getYourNameText(),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: fatherNameController,
                        decoration: InputDecoration(
                          hintText: getFatherNameText(),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: motherNameController,
                        decoration: InputDecoration(
                          hintText: getMotherNameText(),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // DropdownButton(
                    //   value: dropdownvalue,
                    //   icon: const Icon(Icons.keyboard_arrow_down),
                    //   items: items.map((String items) {
                    //     return DropdownMenuItem(
                    //       value: items,
                    //       child: Text(items),
                    //     );
                    //   }).toList(),
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       dropdownvalue = newValue!;
                    //     });
                    //   },
                    // ),
                    // -----------------------------------------------------------
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.grey),
                    //       borderRadius: BorderRadius.circular(4),
                    //     ),
                    //     child: DropdownButtonFormField(
                    //       decoration: const InputDecoration(
                    //         contentPadding:
                    //             EdgeInsets.symmetric(horizontal: 10),
                    //         border: InputBorder.none,
                    //       ),
                    //       value: dropdownvalue,
                    //       icon: const Icon(Icons.keyboard_arrow_down),
                    //       items: items.map((String items) {
                    //         return DropdownMenuItem(
                    //           value: items,
                    //           child: Text(items),
                    //         );
                    //       }).toList(),
                    //       onChanged: (String? newValue) {
                    //         setState(() {
                    //           dropdownvalue = newValue!;
                    //         });
                    //       },
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16), // Reduced padding
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: ExpansionTile(
                              dense: true,
                              tilePadding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              collapsedShape: const OutlineInputBorder(),
                              shape: const OutlineInputBorder(),
                              title: Text(
                                dropdownvalue == null
                                    ? getGenderText()
                                    : dropdownvalue!,
                                style: const TextStyle(fontSize: 16),
                              ),
                              children: [
                                ListTile(
                                  title: Text(getMaleText()),
                                  onTap: () {
                                    setState(() {
                                      dropdownvalue = 'male';
                                    });
                                  },
                                ),
                                ListTile(
                                  title: Text(getFemaleText()),
                                  onTap: () {
                                    setState(() {
                                      dropdownvalue = 'female';
                                    });
                                  },
                                ),
                                ListTile(
                                  title: Text(getOthersText()),
                                  onTap: () {
                                    setState(() {
                                      dropdownvalue = 'others';
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: ExpansionTile(
                              dense: true,
                              tilePadding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              collapsedShape: const OutlineInputBorder(),
                              shape: const OutlineInputBorder(),
                              title: Text(
                                birthDate == null
                                    ? getBirthDateText()
                                    : DateFormat('d MMM yyyy')
                                        .format(birthDate!),
                                style: const TextStyle(fontSize: 16),
                              ),
                              children: [
                                SizedBox(
                                  height: 200,
                                  child: ScrollDatePicker(
                                    selectedDate: birthDate ?? DateTime.now(),
                                    onDateTimeChanged: (DateTime value) {
                                      setState(() {
                                        birthDate = value;
                                      });
                                    },
                                  ),
                                  // ---------------------------------------
                                  // ScrollWheelDatePicker(
                                  //   theme: FlatDatePickerTheme(
                                  //     backgroundColor: Colors.white,
                                  //     overlay:
                                  //         ScrollWheelDatePickerOverlay.holo,
                                  //     itemTextStyle: defaultItemTextStyle
                                  //         .copyWith(color: Colors.black),
                                  //     overlayColor: Colors.black,
                                  //     overAndUnderCenterOpacity: 0.2,
                                  //   ),
                                  //   lastDate: DateTime.now(),
                                  //   onSelectedItemChanged: (value) {
                                  //     setState(() {
                                  //       birthDate = value;
                                  //     });
                                  //   },
                                  // ),
                                  // ---------------------------------------
                                  //     CupertinoDatePicker(
                                  //   mode: CupertinoDatePickerMode.date,
                                  //   initialDateTime: DateTime.now(),
                                  //   onDateTimeChanged: (DateTime newDate) {
                                  //     setState(() {
                                  //       birthDate = newDate;
                                  //     });
                                  //   },
                                  // ),
                                  // ---------------------------------------
                                  // DatePickerDialog(
                                  //     firstDate: DateTime(1990),
                                  //     lastDate: DateTime.now()),
                                ),
                              ],
                            ),
                          ),
                        ],
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
            navigate(context, const NationalDetailsScreen());
          },
        ),
      ),
    );
  }
}
