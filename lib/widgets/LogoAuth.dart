import 'package:flutter/material.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.logopng,
      height: 200,
    );
  }
}
