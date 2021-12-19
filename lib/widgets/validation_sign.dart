import 'package:flutter/material.dart';
import 'package:mata3m/utils/colors.dart';

class ValidationIcon extends StatelessWidget {
  const ValidationIcon({Key? key, this.isError}) : super(key: key);
  final isError;
  @override
  Widget build(BuildContext context) {
    var out;

    debugPrint("Rebuilding ErrorWidget");
    if (isError != null) {
      isError
          ? out = const Icon(Icons.check_rounded, color: kSuccessColor)
          : out = const Icon(
              Icons.close_outlined,
              color: kErrorColor,
            );
    } else {
      out = null;
    }

    return out;
  }
}
