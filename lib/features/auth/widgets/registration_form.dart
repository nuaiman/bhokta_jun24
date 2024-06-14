// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/palette.dart';
import '../notifiers/auth_mode_nitifier.dart';
import 'auth_field.dart';

class RegistrationForm extends ConsumerStatefulWidget {
  const RegistrationForm({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.nidController,
  });
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController nidController;

  @override
  ConsumerState<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends ConsumerState<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime? birthDate;

  void submit(WidgetRef ref) {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    ref.read(authModeProvider.notifier).changeToOtpMode(AuthMode.registration);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // drag handle
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.25,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 4,
                      decoration: BoxDecoration(
                        color: Palette.green,
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(
                          color: Palette.green,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                // auth mode title
                const Text(
                  'রেজিস্ট্রেশন করুন',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'পরবর্তী যেতে দয়া করে সমস্ত বিবরণ লিখুন',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            //Auth fields
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                AuthField(
                  controller: widget.nameController,
                  labelText: 'নাম',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'আপনার পুরো নাম লিখুন';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                AuthField(
                  controller: widget.phoneController,
                  labelText: 'ফোন নম্বর',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 11) {
                      return 'আপনার বৈধ ফোন নম্বর লিখুন';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                AuthField(
                  controller: widget.passwordController,
                  labelText: 'পাসওয়ার্ড',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'পাসওয়ার্ড লিখুন';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                AuthField(
                  controller: widget.confirmPasswordController,
                  labelText: 'কনফার্ম পাসওয়ার্ড',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'পাসওয়ার্ড লিখুন';
                    } else if (widget.confirmPasswordController.text != value) {
                      return 'ভুল  পাসওয়ার্ড';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                AuthField(
                  controller: widget.nidController,
                  labelText: 'NID নম্বর',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'NID নম্বর লিখুন';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 20),
              ],
            ),
            // actions
            Column(
              children: [
                Container(
                  color: Palette.white,
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => submit(ref),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Palette.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'পরবর্তী',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(authModeProvider.notifier)
                            .changeAuthMode(AuthMode.login);
                      },
                      child: const Text(
                        'লগইন করুন',
                        style: TextStyle(
                          fontSize: 16,
                          color: Palette.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
