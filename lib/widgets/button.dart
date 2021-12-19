import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mata3m/utils/colors.dart';

class RoundedCornerButton extends StatelessWidget {
  RoundedCornerButton({
    Key? key,
    this.title = "",
    required this.onPressed,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.hasShadow = false,
    this.hasBorder = false,
    this.icon = null,
    required this.borderRadius,
    this.width = 0.0,
    this.height = 0.0,
    this.textStyle,
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final bool hasShadow;
  final Color? backgroundColor;
  final Color textColor;
  final icon;
  final bool hasBorder;
  final double width;
  final double height;
  final TextStyle? textStyle;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: width.r,
        height: height.r,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: hasBorder
                ? Border.all(color: kPrimaryColor)
                : Border.all(width: 0, color: Colors.transparent),
            boxShadow: hasShadow
                ? [
                    const BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8.0,
                      offset: Offset(0, 4), // changes position of shadow
                    )
                  ]
                : null),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ))),
          child: icon != null
              ? title == ""
                  ? Center(
                      child: icon,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon,
                        SizedBox(width: 9.r),
                        Text(title,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.button!.apply(
                                color: hasBorder
                                    ? textColor
                                    : textColor)),
                      ],
                    )
              : Text(title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.button!.apply(
                      color: hasBorder
                          ? textColor
                          : textColor)),
        ),
      ),
    );
  }
}
