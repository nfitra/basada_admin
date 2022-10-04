import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    this.onTap,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.width,
    this.elevation = 0,
    this.color,
    this.textColor,
    this.borderRadius,
  }) : super(key: key);
  final String text;
  final void Function()? onTap;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final double? elevation;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor ?? Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
