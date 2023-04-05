import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:future_heroes_customer/widgets/guestWidget.dart';

import '../home/NoConnection.dart';

class GuestQRCode extends StatelessWidget {
  const GuestQRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: OfflineBuilder(
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [GuestWidget()],
          ),
        ),
        connectivityBuilder:
            (BuildContext context, ConnectivityResult connectivity, Widget child) {

          final bool connected = connectivity != ConnectivityResult.none;
          return connected?child:NoConnectionScreen();


        },
      ),
    );
  }
}
