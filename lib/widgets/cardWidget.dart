import 'package:flutter/material.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';

class CardWidget extends StatelessWidget {
  String title;
  Function()? onTap;
  Color? color;

  CardWidget({super.key, required this.title, this.color=Colors.grey,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: onTap,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: color!),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.square_outlined,
                color: color!,
              ),
              title: Text(title),
            ),
          ],
        ),
      ),
    ));
  }
}
