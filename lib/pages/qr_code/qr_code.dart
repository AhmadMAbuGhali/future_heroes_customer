// ignore_for_file: empty_catches

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_customer/main.dart';
import 'package:future_heroes_customer/pages/navbar/main_navbar.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';
import 'package:future_heroes_customer/routes/route_helper.dart';
import 'package:future_heroes_customer/services/shared_preference_helper.dart';
import 'package:future_heroes_customer/widgets/CustomButtonPrimary.dart';
import 'package:get/get.dart';

import '../../data/api/dio_client.dart';
import '../../widgets/snakbar.dart';
import '../home/NoConnection.dart';

class QRCode extends StatefulWidget {
  @override
  QRCode({Key? key}) : super(key: key);

  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  var qrstr = "let's Scan it";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.primary,
          title: Text(
            'Recordattendance'.tr,
            style: TextStyle(fontSize: 16.sp, color: ColorManager.white),
          ),
          centerTitle: true,
        ),
        body: OfflineBuilder(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      qrstr,
                      style:
                          TextStyle(color: ColorManager.primary, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    CustomButtonPrimary(
                      text: 'ScanQR'.tr,
                      buttonColor: ColorManager.primary,
                      textColor: ColorManager.white,
                      onpressed: scanQr,
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomButtonPrimary(
                        text: 'Recordattendance'.tr,
                        buttonColor: ColorManager.primary,
                        textColor: ColorManager.white,
                        onpressed: () async {
                          if (qrstr == 'FutureHeroes') {
                            DioClient.dioClient.presenceRegistration();
                            snakbarWidget(context,
                                    Titel: 'qrSuccsesDoneTitle'.tr,
                                    Description: 'qrSuccsesDoneBody'.tr)
                                .Success();
                          } else {
                            snakbarWidget(context,
                                    Titel: 'qrFailTitle'.tr,
                                    Description: 'qrFailBody'.tr)
                                .error();
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
          connectivityBuilder: (BuildContext context,
              List<ConnectivityResult> connectivity, Widget child) {
            final bool connected =
                connectivity.contains(ConnectivityResult.mobile) ||
                    connectivity.contains(ConnectivityResult.wifi);
            return connected ? child : NoConnectionScreen();
          },
        ));
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR)
          .then((value) {
        setState(() {
          qrstr = value;
        });
      });
    } catch (e) {
      setState(() {
        qrstr = 'unable to read this';
      });
    }
  }
}
