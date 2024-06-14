import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:bhokta_consumer/core/constants/palette.dart';
import 'package:bhokta_consumer/core/constants/pngs.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সারসংক্ষেপ'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        actions: const [
          CircleAvatar(
            backgroundColor: Palette.scaffold,
            backgroundImage: AssetImage(Pngs.logo),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFc9daf8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const ListTile(
                        title: Text(
                          'অভিযোগ মুলতুবি',
                          style: TextStyle(fontSize: 14),
                        ),
                        subtitle: Text('2'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFf4cccc),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const ListTile(
                        title: Text(
                          'অভিযোগ প্রক্রিয়াকরণ',
                          style: TextStyle(fontSize: 14),
                        ),
                        subtitle: Text('2'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFfce5cd),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const ListTile(
                        title: Text(
                          'অভিযোগ সমাধান',
                          style: TextStyle(fontSize: 14),
                        ),
                        subtitle: Text('2'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFd9d9d9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const ListTile(
                        title: Text(
                          'অভিযোগ জমা',
                          style: TextStyle(fontSize: 14),
                        ),
                        subtitle: Text('2'),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'সর্বশেষ অভিযোগ',
                          style: Theme.of(context).appBarTheme.titleTextStyle ??
                              Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(),
                          ),
                          child: const SizedBox(
                            height: 120,
                            child: EasyStepper(
                              padding: EdgeInsets.zero,
                              fitWidth: true,
                              activeStep: 4,
                              activeStepTextColor: Colors.black87,
                              finishedStepTextColor: Colors.black87,
                              stepRadius: 14,
                              showStepBorder: false,
                              steps: [
                                EasyStep(
                                  customStep: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Text(
                                      '1',
                                      style: TextStyle(color: Palette.white),
                                    ),
                                  ),
                                  title: 'আবেদন গৃহীত',
                                ),
                                EasyStep(
                                  customStep: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Text(
                                      '2',
                                      style: TextStyle(color: Palette.white),
                                    ),
                                  ),
                                  title: 'প্রক্রিয়া চলমান',
                                  topTitle: true,
                                ),
                                EasyStep(
                                  customStep: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Text(
                                      '3',
                                      style: TextStyle(color: Palette.white),
                                    ),
                                  ),
                                  title: 'তদন্ত',
                                ),
                                EasyStep(
                                  customStep: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Text(
                                      '4',
                                      style: TextStyle(color: Palette.white),
                                    ),
                                  ),
                                  title: 'নিস্পত্তি',
                                  topTitle: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ট্র্যাকিং নম্বর:'),
                            Text('dncpr-4564-4654-4654'),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('আবেদনপত্রের অবস্থা'),
                            Text('বিচারাধীন'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 5,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 8),
                            child: Text(
                              'সর্বশেষ অভিযোগ',
                              style: Theme.of(context)
                                      .appBarTheme
                                      .titleTextStyle ??
                                  Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          DataTable(
                            columns: const [
                              DataColumn(label: Text('ক্রমিক নং')),
                              DataColumn(label: Text('ট্র্যাকিং নম্বর')),
                              DataColumn(label: Text('স্থান')),
                              DataColumn(label: Text('শুনানির তারিখ')),
                              DataColumn(label: Text('শুনানির সময়')),
                            ],
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text('1')),
                                DataCell(Text('dncp-4564-4654-4654')),
                                DataCell(Text('নারায়ণগঞ্জ')),
                                DataCell(Text('01-05-2023')),
                                DataCell(Text('11:00 AM')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('2')),
                                DataCell(Text('dncp-4564-4654-4654')),
                                DataCell(Text('নারায়ণগঞ্জ')),
                                DataCell(Text('05-05-2023')),
                                DataCell(Text('02:00 PM')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('3')),
                                DataCell(Text('dncp-4564-4654-4654')),
                                DataCell(Text('ঢাকা')),
                                DataCell(Text('02-05-2023')),
                                DataCell(Text('10:00 AM')),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
