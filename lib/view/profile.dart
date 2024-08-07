import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rynoz/commonwidget/customcontainer.dart';
import 'package:rynoz/helper/appconfig.dart';
import 'package:rynoz/helper/color_palette.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/font_palette.dart';
import 'package:rynoz/repositories/sharedprefs/shared_prefs.dart';
import 'package:rynoz/view/editprofile.dart';
import 'package:rynoz/view/initialslider.dart';
import 'package:rynoz/view_model/home_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 246, 246),
        automaticallyImplyLeading: true,
      ),
      backgroundColor: const Color.fromARGB(255, 248, 246, 246),
      body: SafeArea(
          child: Consumer<HomeProvider>(builder: (context, values, child) {
        return Column(
          children: [
            CustomContainer(
              borderradius: 8.r,
              boxcolor: "FFFFFF",
              boxshadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 183, 183, 183),
                    blurRadius: 3.r,
                    offset: Offset(0, 2.w))
              ],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22.r,
                        backgroundColor: HexColor("#37C423"),
                        child: CircleAvatar(
                          radius: 21.r,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundImage:
                                const AssetImage('assets/profile.png'),
                            radius: 17.r,
                          ),
                        ),
                      ),
                      15.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppConfig.name ?? ''),
                          // Text("Emp.ID ${AppConfig.id ?? ''}")
                        ],
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditprofileScreen(),
                    )),
                    child: Icon(
                      Icons.edit_outlined,
                      color: HexColor("#37C423"),
                    ),
                  )
                ],
              ).verticalPadding(15.h).horizontalPadding(15.w),
            ),
            15.verticalSpace,
            CustomContainer(
              borderradius: 8.r,
              boxcolor: "FFFFFF",
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/company.png"),
                      15.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Company Details",
                            style: FontPalette.black15500,
                          ),
                          Text(
                            "${values.company?.data![0].companyName}",
                            style: FontPalette.grey12500,
                          )
                        ],
                      )
                    ],
                  ),
                  15.verticalSpace,
                  Container(
                    height: .3.h,
                    color: HexColor("#000000"),
                  ),
                  15.verticalSpace,
                  Row(
                    children: [
                      Image.asset("assets/address.png"),
                      15.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Address",
                              style: FontPalette.black15500,
                            ),
                            Text(
                              "${values.company?.data![0].address}",
                              style: FontPalette.grey12500,
                              maxLines: 2, // Limit to a single line
                              overflow: TextOverflow
                                  .ellipsis, // Optional: Add overflow handling
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  15.verticalSpace,
                  Container(
                    height: .3.h,
                    color: HexColor("#000000"),
                  ),
                  15.verticalSpace,
                  Row(
                    children: [
                      Image.asset("assets/contact.png"),
                      15.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact Details",
                            style: FontPalette.black15500,
                          ),
                          Text(
                            "PH:  ${values.company?.data![0].mobile ?? ''}",
                            style: FontPalette.grey12500,
                          ),
                          Text(
                            "Email: ${values.company?.data![0].email ?? ''}",
                            style: FontPalette.grey12500,
                          )
                        ],
                      )
                    ],
                  ),
                  15.verticalSpace,
                  Container(
                    height: .3.h,
                    color: HexColor("#000000"),
                  ),
                  15.verticalSpace,
                  InkWell(
                    onTap: () {
                      final sharedPrefs = GetIt.instance<SharedPrefs>();
                      sharedPrefs.clearall();

                      Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) =>
                              const FinalSlider(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/logout.png"),
                        15.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Logout",
                              style: FontPalette.black15500,
                            ),
                            Text(
                              "Further secure your account for safety",
                              style: FontPalette.grey12500,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ).verticalPadding(30.h).horizontalPadding(15.w),
            )
          ],
        ).horizontalPadding(20.w);
      })),
    );
  }
}
