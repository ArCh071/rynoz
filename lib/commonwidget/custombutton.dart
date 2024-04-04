import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rynoz/helper/color_palette.dart';
import 'package:rynoz/helper/font_palette.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? title;
  final bool isLoading;
  final VoidCallback? onPressed;
  final Color? shadowColor;
  final bool? enabled;
  final TextStyle? fontStyle;
  final double? borderRadius;
  final Color? color;

  const CustomButton({
    Key? key,
    this.height,
    this.width,
    this.title,
    this.isLoading = false,
    this.onPressed,
    this.shadowColor,
    this.enabled = true,
    this.fontStyle,
    this.borderRadius,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 51.h,
      width: width ?? double.maxFinite,
      child: ElevatedButton(
        onPressed: isLoading || !enabled! ? null : onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 11.r),
          )),
          enableFeedback: enabled,
          backgroundColor: !enabled!
              ? MaterialStateProperty.all(Colors.grey.shade300)
              : MaterialStateProperty.all(color ?? HexColor("#37C423")),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isLoading
              ? SizedBox.square(
                  dimension: (height ?? 45.h) - 15,
                  child: const CircularProgressIndicator(color: Colors.white))
              : FittedBox(
                  child: Text(
                    (title ?? ""),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: fontStyle ?? FontPalette.white18600,
                  ),
                ),
        ),
      ),
    );
  }
}
