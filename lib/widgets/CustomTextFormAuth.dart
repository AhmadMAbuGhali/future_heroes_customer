import 'package:flutter/material.dart';
import 'package:future_heroes_customer/resources/color_manager.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final IconData? iconData;
  final TextEditingController? myController;
  final bool? hidepassword;
  Function()? pressSuffixIcon;
  TextInputType? textInputType;


  CustomTextFormAuth(
      {super.key,
      required this.hintText,
      this.labelText,
      this.iconData,
      this.myController,
      this.textInputType,
        this.pressSuffixIcon,
      this.hidepassword});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: TextFormField(
            keyboardType: textInputType,
            obscureText: hidepassword ?? false,
            controller: myController,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorManager.primary),
                    borderRadius: BorderRadius.circular(10)),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                suffixIcon: IconButton(icon: Icon(iconData,color: ColorManager.primary,),onPressed:  pressSuffixIcon,),
                hintText: hintText,
                hintStyle: TextStyle(color: ColorManager.gray, fontSize: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ],
    );
  }
}
