import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rynoz/commonwidget/custombutton.dart';
import 'package:rynoz/commonwidget/customcontainer.dart';
import 'package:rynoz/commonwidget/customtextfield.dart';
import 'package:rynoz/helper/color_palette.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/font_palette.dart';

class EditprofileScreen extends StatefulWidget {
  const EditprofileScreen({super.key});

  @override
  State<EditprofileScreen> createState() => _EditprofileScreenState();
}

class _EditprofileScreenState extends State<EditprofileScreen> {
  TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 246, 246),
        automaticallyImplyLeading: true,
      ),
      backgroundColor: const Color.fromARGB(255, 248, 246, 246),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35.r,
                      backgroundColor: HexColor("#37C423"),
                      child: CircleAvatar(
                        radius: 34.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundImage:
                              const AssetImage('assets/profile.png'),
                          radius: 29.r,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Keerthi",
                      style: FontPalette.black15400,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Emp.ID ER2234",
                      style: FontPalette.grey13500,
                    )
                  ],
                ),
                10.verticalSpace,
                CustomContainer(
                  borderradius: 8.r,
                  boxcolor: "FFFFFF",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User name",
                        style: FontPalette.black15400,
                      ),
                      5.verticalSpace,
                      CustomText(
                        semanticlabel: "name",
                        controller: username,
                        hintText: "ABC123",
                        hintStyle: FontPalette.grey13500,
                      ),
                      10.verticalSpace,
                      Text(
                        "Address",
                        style: FontPalette.black15400,
                      ),
                      5.verticalSpace,
                      CustomText(
                        semanticlabel: "name",
                        controller: username,
                        hintText: "address 1",
                        hintStyle: FontPalette.grey13500,
                      ),
                      10.verticalSpace,
                      CustomText(
                        semanticlabel: "name",
                        controller: username,
                        hintText: "City",
                        hintStyle: FontPalette.grey13500,
                      ),
                      10.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              semanticlabel: "name",
                              controller: username,
                              hintText: "State",
                              hintStyle: FontPalette.grey13500,
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                              child: CustomText(
                            semanticlabel: "name",
                            controller: username,
                            hintText: "Pincode",
                            hintStyle: FontPalette.grey13500,
                          )),
                        ],
                      ),
                      10.verticalSpace,
                      Text(
                        "Contact Details",
                        style: FontPalette.black15400,
                      ),
                      5.verticalSpace,
                      CustomText(
                        semanticlabel: "name",
                        controller: username,
                        hintText: "Phone Number",
                        hintStyle: FontPalette.grey13500,
                      ),
                      10.verticalSpace,
                      CustomText(
                        semanticlabel: "name",
                        controller: username,
                        hintText: "Email ID",
                        hintStyle: FontPalette.grey13500,
                      ),
                    ],
                  ).horizontalPadding(20.w).verticalPadding(15.h),
                ),
              ],
            ),
            const CustomButton(
              title: "Update Profile",
            )
          ],
        ).horizontalPadding(20.w).bottomPadding(10.h),
      ),
    );
  }
}
