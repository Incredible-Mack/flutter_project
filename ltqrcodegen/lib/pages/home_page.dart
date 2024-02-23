import 'package:flutter/material.dart';
import 'package:ltqrcode/pages/qr_scan.dart';
import 'package:ltqrcode/routes/routes.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  late double _deviceHeight, _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text(
                "Scan Me",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.15),
                child: const Text(
                  "Place the Qr Code inside the frame to scan plase avoid shake to get results quickly",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Column(
            children: [
              icon(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.15),
                child: const Text(
                  "To enable us to scan the QR code and tell you what's inside, kindly provide us access to the camera. To access the link on your browser, click on it.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          getStarted(context),
        ],
      ),
    );
  }

  Widget icon() {
    return Container(
      height: _deviceHeight * 0.2,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assest/icons/icon.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget getStarted(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to the desired route
        Navigator.popAndPushNamed(context, RoutesManager.qrscanner);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 2, 55, 98),
        foregroundColor: Colors.white, // Text color
      ),
      child: const Text(
        "Get Started",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
