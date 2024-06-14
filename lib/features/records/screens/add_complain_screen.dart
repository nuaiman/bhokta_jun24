import 'dart:io';

import 'package:bhokta_consumer/features/auth/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/palette.dart';

class AddComplainScreen extends StatefulWidget {
  const AddComplainScreen({super.key});

  @override
  State<AddComplainScreen> createState() => _AddComplainScreenState();
}

class _AddComplainScreenState extends State<AddComplainScreen> {
  bool agreed = false;
  void toggleAgreed() {
    setState(() {
      agreed = true;
    });
  }

  File? pickedFile;
  DateTime? birthDate;
  final nameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final motherNameController = TextEditingController();
  final professionController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final otherAddressController = TextEditingController();
  final nidController = TextEditingController();
  // ---------------------------------------------------------------------------
  final complainController = TextEditingController();
  final organisationNameController = TextEditingController();
  final organisationAddressController = TextEditingController();
  final organisationDivisionController = TextEditingController();
  final organisationStateController = TextEditingController();
  final complainDetailsController = TextEditingController();
  // ---------------------------------------------------------------------------
  final submitterNameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    professionController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    otherAddressController.dispose();
    nidController.dispose();
    // -------------------------------------
    complainController.dispose();
    organisationNameController.dispose();
    organisationAddressController.dispose();
    organisationDivisionController.dispose();
    organisationStateController.dispose();
    complainDetailsController.dispose();
    // -------------------------------------
    submitterNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return agreed
        ? Scaffold(
            appBar: AppBar(
              title: const Text('অভিযোগ ফরম'),
              actions: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Palette.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'জমা দিন',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'বরাবর',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'মহাপরিচালক/ক্ষমতাপ্রাপ্ত কর্মকর্তা',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'জাতীয় ভোক্তা-অধিকার সংরক্ষণ অধিদপ্তর',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'বিষয় : অভিযোগ দায়ের।',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'জনাব',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'সবিনয় নিবেদন এই যে, আমি নিম্নস্বাক্ষরকারী উপর্যুক্ত বিষয়ে প্রয়োজনীয় তথ্যাদি আপনার সদয় বিবেচনার জন্য উপস্থাপন করলাম।',
                      style: TextStyle(fontSize: 18),
                    ),
                    // ---------------------------------------------------------
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'অভিযোগকারীর বর্ণনা',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    AuthField(
                        controller: nameController,
                        labelText: 'অভিযোগকারীর নাম'),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'আপনার জন্ম তারিখ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all()),
                          child: ListTile(
                            leading: Text(
                              birthDate == null
                                  ? ''
                                  : DateFormat('dd/MM/yyy').format(birthDate!),
                              style: const TextStyle(fontSize: 16),
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                final pickedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime.now(),
                                );
                                if (pickedDate != null) {
                                  setState(() {
                                    birthDate = pickedDate;
                                  });
                                }
                              },
                              icon: const Icon(Icons.calendar_month),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    AuthField(
                        controller: fatherNameController,
                        labelText: 'পিতার নাম'),
                    const SizedBox(height: 12),
                    AuthField(
                        controller: motherNameController,
                        labelText: 'মায়ের নাম'),
                    const SizedBox(height: 12),
                    AuthField(
                        controller: professionController, labelText: 'পেশা'),
                    const SizedBox(height: 12),
                    AuthField(
                        controller: phoneController, labelText: 'মোবাইল নম্বর'),
                    const SizedBox(height: 12),
                    AuthField(controller: emailController, labelText: 'ইমেইল'),
                    const SizedBox(height: 12),
                    AuthField(
                        controller: addressController,
                        labelText: 'স্থায়ী ঠিকানা'),
                    const SizedBox(height: 12),
                    AuthField(
                        controller: otherAddressController,
                        labelText: 'বর্তমান ঠিকানা'),
                    const SizedBox(height: 12),
                    AuthField(
                        controller: nidController,
                        labelText: 'জাতীয় পরিচয় নম্বর/পাসপোর্ট/জন্ম সনদ'),
                    // ---------------------------------------------------------
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'অভিযোগের বর্ণনা',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    AuthField(
                        controller: complainController,
                        labelText: 'অভিযোগের ধরন'),
                    const SizedBox(height: 12),
                    AuthField(
                        controller: organisationNameController,
                        labelText: 'অভিযুক্ত প্রতিষ্ঠানের নাম'),
                    const SizedBox(height: 12),
                    AuthField(
                        controller: organisationAddressController,
                        labelText: 'অভিযুক্ত প্রতিষ্ঠানের ঠিকানা'),
                    const SizedBox(height: 12),
                    AuthField(
                        controller: organisationDivisionController,
                        labelText: 'বিভাগ'),
                    const SizedBox(height: 12),
                    AuthField(
                        controller: organisationStateController,
                        labelText: 'জেলা'),
                    const SizedBox(height: 12),
                    AuthField(
                        controller: complainDetailsController,
                        labelText: 'অভিযোগের বর্ণনা'),
                    // ---------------------------------------------------------
                    const SizedBox(height: 12),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(),
                      ),
                      child: Center(
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                        'উপযুক্ত বিষয়ে ব্যবস্থা গ্রহণের জন্য বিনীত অনুরোধ করছি।'),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 60,
                              child: TextField(
                                onTapOutside: (event) {
                                  FocusManager.instance.primaryFocus!.unfocus();
                                },
                                controller: submitterNameController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            const Text('অভিযোগকারীর নাম'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('নতুন অভিযোগ'),
              actions: [
                ElevatedButton(
                  onPressed: toggleAgreed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Palette.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'আবেদন করুন',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            body: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'আবেদনপত্র পূরণের নিয়ম',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• আবেদনপত্রে লাল স্টার দিয়ে চিহ্নিত ক্ষেত্রগুলো অবশ্যই পূরণ করতে হবে। অন্যান্য ক্ষেত্র ঐচ্ছিক।',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• আবেদন প্রক্রিয়া সম্পূর্ণ করার আগে, প্রয়োজন হলে, খসড়া আবেদনটি সংরক্ষণ করা যেতে পারে এবং পরে পরিষেবা ব্যবস্থাপনা বিকল্প থেকে পুনরায় চালু করা যেতে পারে।',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• আবেদন জমা দেওয়ার পরে, প্রতিটি অ্যাপ্লিকেশনের জন্য একটি অনন্য ট্র্যাকিং নম্বর বরাদ্দ করা হবে যা পরিষেবা ব্যবস্থাপনা বিকল্প থেকে অ্যাপ্লিকেশনের অগ্রগতি ট্র্যাক করতে ব্যবহার করা যেতে পারে।আবেদন করুন',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
  }
}
