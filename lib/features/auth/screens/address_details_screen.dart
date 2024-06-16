import 'professional_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/utils/navigators.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({super.key});

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
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
                const Text(
                  'ঠিকানা প্রদান করুন',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: addressController,
                        decoration: const InputDecoration(
                          hintText: 'সম্পুর্ণ ঠিকানা*',
                          border: OutlineInputBorder(),
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
                                division == null ? 'বিভাগ' : division!,
                                style: const TextStyle(fontSize: 16),
                              ),
                              children: [
                                ListTile(
                                  title: const Text('ঢাকা'),
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
                                division == null ? 'জেলা' : division!,
                                style: const TextStyle(fontSize: 16),
                              ),
                              children: [
                                ListTile(
                                  title: const Text('ঢাকা'),
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
                        decoration: const InputDecoration(
                          hintText: 'পোস্টাল কোড*',
                          border: OutlineInputBorder(),
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
          label: 'পরবর্তী',
          onTap: () {
            navigate(context, const ProfessionalDetailsScreen());
          },
        ),
      ),
    );
  }
}
