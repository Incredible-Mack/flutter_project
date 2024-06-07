import "dart:convert";

import "package:coinbase/models/app_config.dart";
import "package:coinbase/pages/homepage.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get_it/get_it.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  loadConfig();
  runApp(myApp());
}

Future<void> loadConfig() async {
  String _configContent = await rootBundle.loadString('asset/config/main.json');
  Map _configData = jsonDecode(_configContent);

  GetIt.instance.registerSingleton<AppConfig>(
    AppConfig(COIN_BASE_URL: _configData['COIN_API_BASE_URL']),
  );
  // COIN_BASE_URL
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coin Base",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color.fromRGBO(88, 60, 197, 1)),
      home: HomePage(),
    );
  }
}
