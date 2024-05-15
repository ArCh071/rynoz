import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rynoz/commonwidget/custombutton.dart';
import 'package:rynoz/commonwidget/customcontainer.dart';
import 'package:rynoz/commonwidget/customtextfield.dart';
import 'package:rynoz/helper/appconfig.dart';
import 'package:rynoz/helper/color_palette.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/font_palette.dart';
import 'package:rynoz/view_model/home_provider.dart';

class EditprofileScreen extends StatefulWidget {
  const EditprofileScreen({super.key});

  @override
  State<EditprofileScreen> createState() => _EditprofileScreenState();
}

class _EditprofileScreenState extends State<EditprofileScreen> {
  @override
  void initState() {
    username = TextEditingController(text: AppConfig.name);
    address = TextEditingController(text: AppConfig.address);
    state = TextEditingController(text: AppConfig.state);
    pincode = TextEditingController(text: AppConfig.pin);
    phn = TextEditingController(text: AppConfig.phone);
    email = TextEditingController(text: AppConfig.email);

    super.initState();
  }

  TextEditingController username = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController phn = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 246, 246),
        automaticallyImplyLeading: true,
      ),
      backgroundColor: const Color.fromARGB(255, 248, 246, 246),
      body: SingleChildScrollView(
        child: Consumer<HomeProvider>(builder: (context, value, child) {
          return Column(
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
                        AppConfig.name.toString(),
                        style: FontPalette.black15400,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Emp.ID ${AppConfig.id}",
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
                          controller: address,
                          hintText: "address 1",
                          hintStyle: FontPalette.grey13500,
                        ),
                        10.verticalSpace,
                        // CustomText(
                        //   semanticlabel: "name",
                        //   controller: username,
                        //   hintText: "City",
                        //   hintStyle: FontPalette.grey13500,
                        // ),
                        // 10.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: CustomText(
                                semanticlabel: "name",
                                controller: state,
                                hintText: "State",
                                hintStyle: FontPalette.grey13500,
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(
                                child: CustomText(
                              semanticlabel: "name",
                              controller: pincode,
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
                          controller: phn,
                          hintText: "Phone Number",
                          hintStyle: FontPalette.grey13500,
                        ),
                        10.verticalSpace,
                        CustomText(
                          semanticlabel: "name",
                          controller: email,
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
          ).horizontalPadding(20.w).bottomPadding(10.h);
        }),
      ),
    );
  }
}
