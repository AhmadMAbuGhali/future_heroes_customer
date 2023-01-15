import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_customer/resources/assets_manager.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';
import 'package:future_heroes_customer/resources/styles_manager.dart';
import 'package:getwidget/components/button/gf_button.dart';

class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.backGround,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset(ImageAssets.logopng)),
            Text(
              'مرحبا بك عزيزي الطالب',
              style: TextStyle(
                  color: ColorManager.primary, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
