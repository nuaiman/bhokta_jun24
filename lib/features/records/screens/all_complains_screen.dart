import 'package:flutter/material.dart';

class AllComplainsScreen extends StatelessWidget {
  const AllComplainsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('অভিযোগের তালিকা'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('ক্রমিক নং')),
              DataColumn(label: Text('অভিযোগের ধরন')),
              DataColumn(label: Text('অভিযোগ সংস্থার নাম')),
              DataColumn(label: Text('অভিযোগের তারিখ')),
              DataColumn(label: Text('অভিযোগের স্থিতি')),
              DataColumn(label: Text('একশন')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Medicine')),
                DataCell(Text('Ali Baba')),
                DataCell(Text('01-05-2023')),
                DataCell(Text('pending')),
                DataCell(Text('বিস্তারিত')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Medicine')),
                DataCell(Text('Ali Baba')),
                DataCell(Text('01-05-2023')),
                DataCell(Text('pending')),
                DataCell(Text('বিস্তারিত')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Medicine')),
                DataCell(Text('Ali Baba')),
                DataCell(Text('01-05-2023')),
                DataCell(Text('pending')),
                DataCell(Text('বিস্তারিত')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Medicine')),
                DataCell(Text('Ali Baba')),
                DataCell(Text('01-05-2023')),
                DataCell(Text('pending')),
                DataCell(Text('বিস্তারিত')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Medicine')),
                DataCell(Text('Ali Baba')),
                DataCell(Text('01-05-2023')),
                DataCell(Text('pending')),
                DataCell(Text('বিস্তারিত')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Medicine')),
                DataCell(Text('Ali Baba')),
                DataCell(Text('01-05-2023')),
                DataCell(Text('pending')),
                DataCell(Text('বিস্তারিত')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Medicine')),
                DataCell(Text('Ali Baba')),
                DataCell(Text('01-05-2023')),
                DataCell(Text('pending')),
                DataCell(Text('বিস্তারিত')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Medicine')),
                DataCell(Text('Ali Baba')),
                DataCell(Text('01-05-2023')),
                DataCell(Text('pending')),
                DataCell(Text('বিস্তারিত')),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Medicine')),
                DataCell(Text('Ali Baba')),
                DataCell(Text('01-05-2023')),
                DataCell(Text('pending')),
                DataCell(Text('বিস্তারিত')),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
