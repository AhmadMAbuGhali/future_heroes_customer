// ignore_for_file: empty_catches

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../data/api/dio_client.dart';
import '../../widgets/snakbar.dart';
import '../home/NoConnection.dart';

class QRCode extends StatefulWidget {
  const QRCode({Key? key}) : super(key: key);

  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    controller?.resumeCamera();
    return Scaffold(
      body: OfflineBuilder(
        child: Column(
          children: <Widget>[
            Expanded(flex: 9, child: _buildQrView(context)),
            Expanded(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 25.h,
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.primary),
                              onPressed: () async {
                                await controller?.toggleFlash();
                                setState(() {});
                              },
                              child: FutureBuilder(
                                future: controller?.getFlashStatus(),
                                builder: (context, snapshot) {
                                  return const Icon(
                                    Icons.flash_on,
                                    size: 20,
                                  );
                                },
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 25.h,
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.primary),
                              onPressed: () async {
                                await controller?.flipCamera();
                                setState(() {});
                              },
                              child: FutureBuilder(
                                future: controller?.getCameraInfo(),
                                builder: (context, snapshot) {
                                  if (snapshot.data != null) {
                                    return const Center(
                                        child: Icon(
                                      Icons.flip_camera_ios,
                                      size: 20,
                                    ));
                                  } else {
                                    return const Center(
                                        child: Icon(
                                      Icons.flip_camera_ios,
                                      size: 20,
                                    ));
                                  }
                                },
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        connectivityBuilder:
            (BuildContext context, ConnectivityResult connectivity, Widget child) {

          final bool connected = connectivity != ConnectivityResult.none;
          return connected?child:NoConnectionScreen();


        },
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (result != null && result!.code == "FutureHeroes") {
        try {
          DioClient.dioClient.presenceRegistration();
          Get.offNamed(RouteHelper.initial);
          snakbarWidget(context,
                  Titel: 'qrSuccsesDoneTitle'.tr,
                  Description: 'qrSuccsesDoneBody'.tr)
              .Success();
        } catch (e) {}
      } else {
        snakbarWidget(context,
                Titel: 'qrFailTitle'.tr, Description: 'qrFailBody'.tr)
            .error();
        Get.offNamed(RouteHelper.initial);

      }

      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
