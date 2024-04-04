import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rynoz/commonwidget/custombutton.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/font_palette.dart';
import 'package:rynoz/view/initialslider.dart';

class RecoveryPassword extends StatefulWidget {
  const RecoveryPassword({super.key});

  @override
  State<RecoveryPassword> createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset("assets/email.png"),
                20.verticalSpace,
                Text(
                  "Check Your Mail",
                  style: FontPalette.black16700,
                ),
                15.verticalSpace,
                Text(
                  "Please check your email.",
                  style: FontPalette.black13500,
                ),
                Text(
                  "We have sent you an email that contains ",
                  style: FontPalette.black13500,
                ),
                Text(
                  "a link to reset your password",
                  style: FontPalette.black13500,
                ),
              ],
            ),
            Column(
              children: [
                CustomButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FinalSlider(),
                  )),
                  title: "Back To Sign in",
                ).bottomPadding(100.h),
                Text(
                  "Did not receive the email? Check your spam",
                  style: FontPalette.black12500underline,
                ),
                Text(
                  "filter or try another email address",
                  style: FontPalette.black12500underline,
                )
              ],
            ),
          ],
        ).horizontalPadding(25.w).verticalPadding(20.h),
      )),
    );
  }
}
