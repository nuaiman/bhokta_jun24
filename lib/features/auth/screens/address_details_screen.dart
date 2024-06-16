import 'package:bhokta_consumer/core/constants/palette.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/pngs.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({super.key});

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
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
                      'ঠিকানা তথ্য প্রদান',
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
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Column(
                      children: [
                        const TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: 'পরিচয় তথ্য নির্বাচন',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ),
                        const Divider(color: Palette.black),
                        TextField(
                          controller: nidController,
                          decoration: const InputDecoration(
                            hintText: 'জাতীয় পরিচয় পত্রের নাম্বার',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ),
                        const Divider(color: Palette.black),
                        TextField(
                          controller: birthIdController,
                          decoration: const InputDecoration(
                            hintText: 'জন্মনিবন্ধন সনদের নাম্বার',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                        ),
                        const Divider(color: Palette.black),
                        TextField(
                          controller: passportIdController,
                          decoration: const InputDecoration(
                            hintText: 'পাসপোর্টের নাম্বার',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          ),
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
          label: 'পরবর্তী',
          onTap: () {
            // navigate(context, const PersonalDetailsScreen());
          },
        ),
      ),
    );
  }
}
