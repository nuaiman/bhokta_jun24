// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:permission_handler/permission_handler.dart';

// import '../../../models/gps.dart';

// class GpsNotifier extends StateNotifier<Gps> {
//   GpsNotifier()
//       : super(
//           Gps(
//             latitude: 0,
//             longitude: 0,
//             address: '',
//             otherAddress: '',
//           ),
//         );

//   Future<Gps> fetchCurrentLocation(BuildContext context) async {
//     if (!await checkAndRequestLocationPermission(context)) {
//       throw Exception('Location permission not granted');
//     }

//     try {
//       final position = await Geolocator.getCurrentPosition();
//       final placemarks =
//           await placemarkFromCoordinates(position.latitude, position.longitude);

//       if (placemarks.isEmpty) {
//         throw Exception(
//             'Couldn\'t get current location details. Please restart.');
//       }

//       final place = placemarks[2];

//       final gps = Gps(
//         address:
//             '${place.street}, ${place.locality} - ${place.postalCode}, ${place.administrativeArea}, ${place.country}',
//         otherAddress:
//             '${place.street}, ${place.locality} - ${place.postalCode}, ${place.administrativeArea}, ${place.country}',
//         latitude: position.latitude,
//         longitude: position.longitude,
//       );
//       state = gps;
//       print(state);
//       return gps;
//     } catch (e) {
//       _showErrorDialog(context, 'Location Error',
//           'An error occurred while fetching location: $e');
//       throw Exception('Error fetching location: $e');
//     }
//   }

//   Future<Gps?> getLocationFromLatLng(double latitude, double longitude) async {
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(latitude, longitude);
//     final place = placemarks[2];
//     Gps model = Gps(
//       address:
//           '${place.street}, ${place.locality} - ${place.postalCode}, ${place.administrativeArea}, ${place.country}',
//       otherAddress:
//           '${place.street}, ${place.locality} - ${place.postalCode}, ${place.administrativeArea}, ${place.country}',
//       latitude: latitude,
//       longitude: longitude,
//     );
//     return model;
//   }

//   Future<bool> checkAndRequestLocationPermission(BuildContext context) async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       _showErrorDialog(
//         context,
//         'Location Permission',
//         'Please enable location service and allow location permission from settings.',
//         showSettingsButton: true,
//       );
//       return false;
//     }

//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied ||
//           permission == LocationPermission.deniedForever) {
//         _showErrorDialog(
//           context,
//           'Location Permission',
//           'Please enable location service and allow location permission from settings.',
//           showSettingsButton: true,
//         );
//         return false;
//       }
//     }
//     return true;
//   }

//   void _showErrorDialog(
//     BuildContext context,
//     String title,
//     String content, {
//     bool showSettingsButton = false,
//   }) {
//     if (context.mounted) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text(title),
//           content: Text(content),
//           actions: [
//             if (showSettingsButton)
//               TextButton(
//                 onPressed: () {
//                   // Open app settings
//                   openAppSettings();
//                   Navigator.of(context).pop(); // Dismiss dialog
//                 },
//                 child: const Text('Settings'),
//               ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Dismiss dialog
//                 exit(0); // Exit app
//               },
//               child: const Text('Close'),
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }
// // -----------------------------------------------------------------------------

// final gpsProvider = StateNotifierProvider<GpsNotifier, Gps>((ref) {
//   return GpsNotifier();
// });
