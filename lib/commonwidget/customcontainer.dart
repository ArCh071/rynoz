import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rynoz/helper/color_palette.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final String? boxcolor;
  final double? borderwidth;
  final double? borderradius;
  final String? bordercolor;
  final Function()? ontap;
  final List<BoxShadow>? boxshadow;
  final Widget? child;
  const CustomContainer(
      {super.key,
      this.bordercolor,
      this.height,
      this.boxshadow,
      this.boxcolor,
      this.width,
      this.borderradius,
      this.borderwidth,
      this.child,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        decoration: BoxDecoration(
            color: HexColor(boxcolor ?? 'FFFFFF'),
            borderRadius: BorderRadius.circular(borderradius ?? 12.r),
            border: Border.all(
                color: HexColor(bordercolor ?? 'FFFFFF'),
                width: borderwidth ?? 1.sp),
            boxShadow: boxshadow ?? []),
        child: child,
      ),
    );
  }
}
