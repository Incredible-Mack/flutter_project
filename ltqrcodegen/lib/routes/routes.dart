import 'package:flutter/material.dart';
import 'package:ltqrcode/pages/qr_scan.dart';

class RoutesManager {
  static const qrscanner = 'qrscanner';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case qrscanner:
        return MaterialPageRoute(builder: (context) => const QrScanner());

      default:
        throw Exception("No route found");
    }
  }
}
