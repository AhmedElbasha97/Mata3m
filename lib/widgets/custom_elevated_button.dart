import 'package:flutter/material.dart';
import 'package:mata3m/utils/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.width,
      required this.height,
      this.icon,
      this.background,
      this.forground,
      this.text,
      this.onPressed,
      this.circle = false, this.hasTextStyle=false, this.textStyle = null})
      : super(key: key);
  final double width;
  final textStyle;
  final double height;
  final icon;
  final text;
  final hasTextStyle;
  final forground;
  final onPressed;
  final background;
  final bool circle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(

          splashFactory: InkSplash.splashFactory,
          fixedSize: MaterialStateProperty.all(Size(width, height)),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return kPrimaryColor;
            }
            return background;
          }),

          foregroundColor: MaterialStateProperty.all(forground),
          shape:
              circle ? MaterialStateProperty.all(const CircleBorder()) : null),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon,
          if (text != null) ...[
            if (icon != null) SizedBox(width: 9),
            if (hasTextStyle) Text(
              text,
              style: textStyle,
            ) else Text(
              text,
            ),
          ]
        ],
      ),
    );
  }
}
