import 'package:bhokta_consumer/features/auth/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/palette.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final fullnameController = TextEditingController();
  final fathernameController = TextEditingController();
  final mothernameController = TextEditingController();
  final professionController = TextEditingController();
  final nidController = TextEditingController();
  DateTime? birthDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Icon(Icons.add),
          ),
        ),
        title: const Text('প্রোফাইল'),
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
              'সংরক্ষণ',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            AuthField(controller: fullnameController, labelText: 'পুরো নাম'),
            SizedBox(height: 8),
            AuthField(controller: nidController, labelText: 'এনআইডি'),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'জন্ম তারিখ',
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
            SizedBox(height: 8),
            AuthField(controller: professionController, labelText: 'পেশা'),
            SizedBox(height: 8),
            AuthField(controller: fathernameController, labelText: 'বাবার নাম'),
            SizedBox(height: 8),
            AuthField(
                controller: mothernameController, labelText: 'মায়ের নাম'),
            SizedBox(height: 8),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  label: Text('পাসওয়ার্ড পরিবর্তন'),
                  icon: Icon(Icons.lock_reset),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
