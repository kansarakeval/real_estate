import 'package:flutter/material.dart';
import 'package:real_estate/util/color.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  Color? labelColor;
  String? label;
  Gradient? gradient;
  IconData? iconData;

  CustomTextField(
      {this.controller,
      this.labelColor,
      this.label,
      this.gradient,
      this.iconData});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: iconData != null ? Icon(iconData) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        labelText: label ?? "",
        labelStyle: TextStyle(
          color: labelColor ?? blue,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }
}
