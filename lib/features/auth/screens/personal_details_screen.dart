import 'national_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/utils/navigators.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
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
                const Column(
                  children: [
                    Text(
                      'ব্যাক্তিগত তথ্য প্রদান',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'করুন',
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
                        decoration: const InputDecoration(
                          hintText: 'আপনার নাম',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: fatherNameController,
                        decoration: const InputDecoration(
                          hintText: 'আপনার পিতার নাম',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: motherNameController,
                        decoration: const InputDecoration(
                          hintText: 'আপনার মায়ের নাম',
                          border: OutlineInputBorder(),
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
                                    ? 'লিঙ্গ'
                                    : dropdownvalue!,
                                style: const TextStyle(fontSize: 16),
                              ),
                              children: [
                                ListTile(
                                  title: const Text('পুরুষ'),
                                  onTap: () {
                                    setState(() {
                                      dropdownvalue = 'পুরুষ';
                                    });
                                  },
                                ),
                                ListTile(
                                  title: const Text('নারী'),
                                  onTap: () {
                                    setState(() {
                                      dropdownvalue = 'নারী';
                                    });
                                  },
                                ),
                                ListTile(
                                  title: const Text('অন্যান্য'),
                                  onTap: () {
                                    setState(() {
                                      dropdownvalue = 'অন্যান্য';
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
                              title: const Text(
                                'জন্ম তারিখ*',
                                style: TextStyle(fontSize: 16),
                              ),
                              children: [
                                SizedBox(
                                  height: 200,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: DateTime.now(),
                                    onDateTimeChanged: (DateTime newDate) {
                                      setState(() {
                                        birthDate = newDate;
                                      });
                                    },
                                  ),
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
          label: 'পরবর্তী',
          onTap: () {
            navigate(context, const NationalDetailsScreen());
          },
        ),
      ),
    );
  }
}
