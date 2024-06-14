import 'package:bhokta_consumer/core/constants/palette.dart';
import 'package:bhokta_consumer/features/auth/screens/profile_screen.dart';
import 'package:bhokta_consumer/features/home/screens/dashboard_screen.dart';
import 'package:bhokta_consumer/features/records/screens/add_complain_screen.dart';
import 'package:bhokta_consumer/features/records/screens/all_complains_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final screens = [
    DashboardScreen(),
    const AddComplainScreen(),
    const AllComplainsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: Palette.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'ড্যাশবোর্ড',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'নতুন অভিযোগ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'অভিযোগের তালিকা',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'প্রোফাইল',
          ),
        ],
      ),
    );
  }
}
