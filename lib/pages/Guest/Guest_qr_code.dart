import 'package:flutter/material.dart';
import 'package:future_heroes_customer/widgets/guestWidget.dart';

class GuestQRCode extends StatelessWidget {
  const GuestQRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [GuestWidget()],
        ),
      ),
    );
  }
}
