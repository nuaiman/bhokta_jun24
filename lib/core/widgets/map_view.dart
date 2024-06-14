// import 'package:flutter/material.dart';
// import 'package:maplibre_gl/maplibre_gl.dart';

// import '../constants/secret_keys.dart';

// class MapView extends StatefulWidget {
//   const MapView({super.key});

//   @override
//   State<MapView> createState() => _MapViewState();
// }

// class _MapViewState extends State<MapView> {
//   CameraPosition initialPosition = const CameraPosition(
//       target: LatLng(23.6181074, 90.5008528),
//       zoom: 12); //CameraPosition object for initial location in map
//   MaplibreMapController? mController;

//   @override
//   void dispose() {
//     mController!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String styleId = 'osm-liberty';
//     // String styleId = 'barikoi-dark';
//     String apiKey = SecretKeys.bKoiKey;
//     String mapUrl =
//         'https://map.barikoi.com/styles/$styleId/style.json?key=$apiKey';
//     return Scaffold(
//       body: MaplibreMap(
//         initialCameraPosition: initialPosition,
//         onMapCreated: (MaplibreMapController mapController) {
//           mController = mapController;
//         },
//         styleString: mapUrl,
//       ),
//     );
//   }
// }
