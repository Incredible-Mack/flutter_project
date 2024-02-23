import 'package:flutter/material.dart';
import 'package:ltqrcode/pages/home_page.dart';
import 'package:ltqrcode/pages/qr_scan.dart';
import 'package:ltqrcode/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LT SCANNER",
      onGenerateRoute: RoutesManager.onGenerateRoute,
      theme: ThemeData(
        colorSchemeSeed: const Color.fromRGBO(13, 123, 131, 1),
      ),
      home: Homepage(),
    );
  }
}
