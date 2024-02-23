import 'package:flutter/material.dart';
import 'package:ltqrcode/pages/qr_scan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LT SCANNER",
      theme: ThemeData(
        colorSchemeSeed: const Color.fromRGBO(13, 123, 131, 1),
      ),
      home: const QrScanner(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// const String _url = 'https://google.com';

// void main() => runApp(
//       const MaterialApp(
//         home: Material(
//           child: Center(
//             child: ElevatedButton(
//               onPressed: _launchUrl,
//               child: Text('Show Flutter homepage'),
//             ),
//           ),
//         ),
//       ),
//     );

// Future<void> _launchUrl() async {
//   if (!await launch(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }
