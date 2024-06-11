import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:todo_app/Core/utils/styles.dart';

import 'qr_control_buttons.dart';

class QrView extends StatefulWidget {
  const QrView({Key? key}) : super(key: key);

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isFlashOn = false, isCameraFront = false, isCameraPaused = false;

  /* In order to get hot reload to work we need to pause the camera if the platform
  is android, or resume the camera if the platform is iOS. */
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.blueAccent,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Scan QR Code',
                style: AppStyles.styleBold16.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: QrControlButtons(
              isCameraPaused: isCameraPaused,
              onPausePressed: () {
                isCameraPaused
                    ? controller?.resumeCamera()
                    : controller?.pauseCamera();
                setState(() {
                  isCameraPaused = !isCameraPaused;
                });
              },
              isCameraFront: isCameraFront,
              onFlipPressed: () {
                if (!isCameraPaused) {
                  setState(() {
                    isCameraFront = !isCameraFront;
                  });
                  controller?.flipCamera();
                }
              },
              isFlashOn: isFlashOn,
              onFlashPressed: () {
                setState(() {
                  isFlashOn = !isFlashOn;
                });
                controller?.toggleFlash();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        setState(() {
          result = scanData;
        });
      }
    });
  }
}
