import 'package:flutter/material.dart';

class AppTextComponent extends StatelessWidget {
  const AppTextComponent(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontFamily: 'DynaPuff',
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
