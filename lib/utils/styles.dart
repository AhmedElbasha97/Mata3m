import 'package:flutter/material.dart';
import 'package:mata3m/utils/utils.dart';

import 'colors.dart';

class Styles {
  static final kTextStyleRegular = TextStyle(
      fontSize: 16, fontFamily: kFontFamily, fontWeight: FontWeight.normal);
  static final kTextStyleDescription = extend(
      kTextStyleRegular,
      TextStyle(
        fontSize: 14,
      ));
  static final kTextStyleSmallDescription = extend(
      kTextStyleRegular,
      TextStyle(
        fontSize: 8,
      ));
  static final kTextStyleDescriptive = extend(
      kTextStyleDescription,
      TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ));
  static final kTextStyleHelperText = extend(
      kTextStyleRegular,
      TextStyle(
        color: kGrayColor,
        fontSize: 11,
      ));
  static final kTextStyleHeadline = extend(
      kTextStyleRegular,
      TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 34,
      ));
  static final kTextStyleitemHeadline = extend(
      kTextStyleRegular,
      TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ));
  static final kTextStyleMassiveHeadline = extend(
      kTextStyleRegular,
      TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 48,
      ));
  static final kTextStyleSubheads = extend(
      kTextStyleRegular,
      const TextStyle(
        fontWeight: FontWeight.w600,
      ));
  static final kTextStyleHeadline2 = extend(
      kTextStyleSubheads,
      TextStyle(
        fontSize: 24,
      ));
  static final kTextStyleHeadline3 = extend(
      kTextStyleSubheads,
      TextStyle(
        fontSize: 18,
      ));

  static final TextTheme textTheme = TextTheme(
    headline1: kTextStyleHeadline,
    headline2: kTextStyleHeadline2,
    headline6: kTextStyleHeadline3,
    subtitle1: kTextStyleSubheads,
    button: kTextStyleDescriptive,
    caption: kTextStyleHelperText,
    overline: kTextStyleHelperText,
    bodyText1: kTextStyleRegular,
    bodyText2: kTextStyleDescription,
  );
}
