import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/utils/navigators.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import 'add_profile_picture_screen.dart';

class ProfessionalDetailsScreen extends StatefulWidget {
  const ProfessionalDetailsScreen({super.key});

  @override
  State<ProfessionalDetailsScreen> createState() =>
      _ProfessionalDetailsScreenState();
}

class _ProfessionalDetailsScreenState extends State<ProfessionalDetailsScreen> {
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
              children: [
                const Column(
                  children: [
                    Text(
                      'পেশাগত তথ্য প্রদান',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ExpansionTile(
                    dense: true,
                    tilePadding: const EdgeInsets.symmetric(horizontal: 8),
                    collapsedShape: const OutlineInputBorder(),
                    shape: const OutlineInputBorder(),
                    title: Text(
                      dropdownvalue == null ? 'আমি একজন ' : dropdownvalue!,
                      style: const TextStyle(fontSize: 16),
                    ),
                    children: [
                      ListTile(
                        title: const Text('শিক্ষার্থী'),
                        onTap: () {
                          setState(() {
                            dropdownvalue = 'শিক্ষার্থী';
                          });
                        },
                      ),
                      ListTile(
                        title: const Text('ব্যবসায়ী'),
                        onTap: () {
                          setState(() {
                            dropdownvalue = 'ব্যবসায়ী';
                          });
                        },
                      ),
                      ListTile(
                        title: const Text('চাকুরীজীবী'),
                        onTap: () {
                          setState(() {
                            dropdownvalue = 'চাকুরীজীবী';
                          });
                        },
                      ),
                      ListTile(
                        title: const Text('গৃহিণী'),
                        onTap: () {
                          setState(() {
                            dropdownvalue = 'গৃহিণী';
                          });
                        },
                      ),
                      ListTile(
                        title: const Text('কৃষক'),
                        onTap: () {
                          setState(() {
                            dropdownvalue = 'কৃষক';
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
            navigate(context, const AddProfilePictureScreen());
          },
        ),
      ),
    );
  }
}
