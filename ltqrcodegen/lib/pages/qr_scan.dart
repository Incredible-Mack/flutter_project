import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isCameraEnabled = true;
  bool isButtonActive = false;
  String _url = '';

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            isCameraEnabled ? buildQrView() : Container(),
            //Positioned(bottom: 10, child: buildResult()),
            Positioned(top: 10, child: buildControllBtn()),
            isButtonActive
                ? ElevatedButton(
                    onPressed: _launchUrl,
                    child: Text(_url),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launch(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Widget buildResult() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white30,
      ),
      padding: const EdgeInsets.all(5),
      child: Text(
        result != null ? '${result!.code}' : 'Scan QR Code',
        maxLines: 3,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildControllBtn() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: FutureBuilder(
                  future: controller?.getFlashStatus(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return const Icon(Icons.flash_off);
                    } else {
                      return const Icon(Icons.flash_on);
                    }
                  }),
              onPressed: () async {
                await controller?.toggleFlash();
                setState(() {});
              },
            ),
            IconButton(
              icon: FutureBuilder(
                  future: controller?.getCameraInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return const Icon(Icons.switch_camera);
                    } else {
                      return Container();
                    }
                  }),
              onPressed: () async {
                await controller!.flipCamera();
                setState(() {});
              },
            ),
          ],
        ),
      );

  Widget buildQrView() {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderWidth: 6,
        borderLength: 30,
        borderRadius: 10,
        borderColor: Theme.of(context).primaryColorDark,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        _url = result!.code.toString();
        if (result != null) {
          isButtonActive = true;
        }
      });
    });
  }
}
