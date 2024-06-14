// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../constants/palette.dart';

// final ThemeData lightTheme = ThemeData(
//   useMaterial3: true,
//   fontFamily: 'Poppins',
//   brightness: Brightness.light,
//   scaffoldBackgroundColor: Palette.scaffoldLite,
//   appBarTheme: const AppBarTheme(
//     backgroundColor: Palette.scaffoldLite,
//     surfaceTintColor: Palette.scaffoldLite,
//   ),
// );

// final ThemeData darkTheme = ThemeData(
//   useMaterial3: true,
//   fontFamily: 'Poppins',
//   brightness: Brightness.dark,
//   scaffoldBackgroundColor: Palette.scaffoldDark,
//   appBarTheme: const AppBarTheme(
//     backgroundColor: Palette.scaffoldDark,
//     surfaceTintColor: Palette.scaffoldDark,
//   ),
// );

// // -----------------------------------------------------------------------------

// class ThemeNotifier extends StateNotifier<ThemeData> {
//   ThemeNotifier() : super(lightTheme) {
//     _loadTheme();
//   }

//   static const String _themeKey = 'themeMode';

//   Future<void> _loadTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     final themeIndex = prefs.getInt(_themeKey) ?? 0;
//     if (themeIndex == 0) {
//       state = lightTheme;
//     } else {
//       state = darkTheme;
//     }
//   }

//   Future<void> toggleTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (state.brightness == Brightness.light) {
//       state = darkTheme;
//       await prefs.setInt(_themeKey, 1);
//     } else {
//       state = lightTheme;
//       await prefs.setInt(_themeKey, 0);
//     }
//   }
// }
// // -----------------------------------------------------------------------------

// final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
//   return ThemeNotifier();
// });
