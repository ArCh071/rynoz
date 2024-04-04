import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rynoz/commonwidget/custombutton.dart';
import 'package:rynoz/commonwidget/customtextfield.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/font_palette.dart';
import 'package:rynoz/view/recoverpassword.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "Reset Password",
                    style: FontPalette.black16700,
                  )
                ],
              ),
              5.verticalSpace,
              Row(children: [
                Expanded(
                  child: Text(
                    "Enter the email associated with your account and we will send an emailwith instructions to reset password",
                    maxLines: 2,
                    style: FontPalette.black12400,
                  ),
                )
              ]),
              30.verticalSpace,
              Row(
                children: [
                  Text(
                    "Email Address",
                    style: FontPalette.black15400,
                  )
                ],
              ),
              5.verticalSpace,
              CustomText(
                semanticlabel: "enter email",
                hintText: "ABC123",
                hintStyle: FontPalette.grey14600,
              ),
            ],
          ),
          CustomButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RecoveryPassword(),
            )),
            title: "Send Link",
          ).verticalPadding(30.h)
        ],
      ).horizontalPadding(25.w)),
    );
  }
}
