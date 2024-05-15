import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rynoz/commonwidget/custombutton.dart';
import 'package:rynoz/commonwidget/customtextfield.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/font_palette.dart';
import 'package:rynoz/helper/helpers.dart';
import 'package:rynoz/view/home.dart';
import 'package:rynoz/view/reset_password.dart';
import 'package:rynoz/view_model/home_provider.dart';

class InitialSliderScreen extends StatefulWidget {
  const InitialSliderScreen({Key? key}) : super(key: key);

  @override
  State<InitialSliderScreen> createState() => _InitialSliderScreenState();
}

class _InitialSliderScreenState extends State<InitialSliderScreen> {
  final PageController _pageController = PageController();
  final ValueNotifier<double> _opacityValueOne = ValueNotifier(1.0);
  final ValueNotifier<double> _opacityValueTwo = ValueNotifier(1.0);
  final ValueNotifier<double> _opacityValueThree = ValueNotifier(1.0);

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      pageControllerListener();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  pageControllerListener() {
    _pageController.addListener(() {
      if (_pageController.hasClients) {
        switch (_pageController.page?.ceil()) {
          case 1:
            {
              _opacityValueOne.value = _pageController.position.pixels;
              break;
            }
          case 2:
            {
              _opacityValueTwo.value =
                  (_pageController.position.pixels - context.sw());

              break;
            }
          case 3:
            {
              _opacityValueThree.value =
                  (_pageController.position.pixels - (context.sw() * 2));

              break;
            }
          default:
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "Introduction screen",
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  ValueListenableBuilder(
                      valueListenable: _opacityValueOne,
                      builder: (context, value, child) {
                        return _Slider(
                          opacityValue: value,
                          sliderImage: "assets/slider1.png",
                          semanticLabel: "Introduction page one",
                          titleText: "Historical",
                          subText:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                          controller: _pageController,
                        );
                      }),
                  ValueListenableBuilder(
                      valueListenable: _opacityValueTwo,
                      builder: (context, value, child) {
                        return _Slider(
                          opacityValue: value,
                          semanticLabel: "Introduction page two",
                          sliderImage: "assets/slider2.png",
                          titleText: "Financial",
                          subText:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                          controller: _pageController,
                        );
                      }),
                  ValueListenableBuilder(
                      valueListenable: _opacityValueThree,
                      builder: (context, value, child) {
                        return _Slider(
                          opacityValue: value,
                          semanticLabel: "Introduction page three",
                          sliderImage: "assets/slider3.png",
                          titleText: "Analytic",
                          subText:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                          controller: _pageController,
                        );
                      }),
                  // const FinalSlider()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Slider extends StatelessWidget {
  final double opacityValue;
  final String sliderImage;
  final String? titleText;
  // final Function()? ontap;
  final String? semanticLabel;
  final String? subText;
  final PageController? controller;
  const _Slider({
    Key? key,
    this.semanticLabel,
    // this.ontap,
    this.opacityValue = 1.0,
    required this.sliderImage,
    this.titleText,
    this.subText,
    this.controller,
  }) : super(key: key);

  double getWithOpacityValue(BuildContext context) {
    if (opacityValue / context.sw() <= 0.0) {
      return 0.0;
    } else if (opacityValue / context.sw() >= 1.0) {
      return 1.0;
    } else {
      return opacityValue / context.sw();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              // controller?.jumpToPage(4);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FinalSlider(),
              ));
            },
            child: Text(
              "Skip >>",
              style: FontPalette.green13400,
              textAlign: TextAlign.center,
            ).bottomPadding(25.h).rightPadding(10.w),
          ),
        ).topPadding(15.h).rightPadding(5.w),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(sliderImage), fit: BoxFit.fill)),
        ),
        50.verticalSpace,
        Text(
          titleText ?? "",
          style: FontPalette.black35700,
          textAlign: TextAlign.center,
        ).horizontalPadding(53.w),
        23.verticalSpace,
        Text(
          subText ?? "",
          style: FontPalette.black18500,
          textAlign: TextAlign.center,
        ).horizontalPadding(80.w),
        25.verticalSpace,
      ],

      // Container(color: Colors.grey.withOpacity(getWithOpacityValue(context))),
    ));
  }
}

class FinalSlider extends StatelessWidget {
  const FinalSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeprovider = context.read<HomeProvider>();
    final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
    final TextEditingController password = TextEditingController();

    final TextEditingController memberid = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/login.png"),
                  25.verticalSpace,
                  Row(
                    children: [
                      Text(
                        "Welcome to",
                        style: FontPalette.black16400,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Rynoz",
                        style: FontPalette.black36600,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  30.verticalSpace,
                  Row(
                    children: [
                      Text(
                        "User name",
                        style: FontPalette.black16400,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  CustomText(
                    controller: memberid,
                    semanticlabel: "enter your username",
                    hintText: "ABC123",
                    hintStyle: FontPalette.grey16400,
                    textInputAction: TextInputAction.next,
                  ),
                  15.verticalSpace,
                  Row(
                    children: [
                      Text(
                        "Password",
                        style: FontPalette.black16400,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  CustomText(
                    obscureText: true,
                    makePasswordField: true,
                    controller: password,
                    textInputAction: TextInputAction.done,
                    semanticlabel: "enter your password",
                    hintText: "******",
                    hintStyle: FontPalette.grey16400,
                  ),
                  30.verticalSpace,
                  ValueListenableBuilder<bool>(
                      valueListenable: isLoading,
                      builder: (context, value, child) {
                        return CustomButton(
                            // enabled: value,
                            isLoading: value,
                            title: "Sign In",
                            // color: HexColor("#5A2D74"),

                            onPressed: () async {
                              if (memberid.text.isNotEmpty ||
                                  password.text.isNotEmpty) {
                                FocusScope.of(context).unfocus();

                                if (isLoading.value) return;
                                isLoading.value = true;
                                await homeprovider
                                    .login(
                                        username: memberid.text,
                                        password: password.text)
                                    .catchError((error) {
                                  isLoading.value = false;
                                  return error;
                                });
                                isLoading.value = false;

                                if (homeprovider.logindata?.status == 200 &&
                                    homeprovider.logindata?.data![0].isActive ==
                                        true) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Home1(),
                                  ));
                                  final home = context.read<HomeProvider>();
                                  await home.getcategory();
                                  home.getpaymentsub();
                                  home.getpaymentmode();
                                  await home.getbranch();
                                  home.getminimumstock();
                                  home.getexpirystock();
                                  await home.getmonthwisegraphs(
                                      branchid:
                                          home.branchdata?.data![0].branchId);
                                  await home.getproduct(
                                      count: 5,
                                      categoryid: home
                                          .categorydata?.data![0].categoryID);
                                } else {
                                  Helpers.showToast(
                                      "${homeprovider.logindata?.message}");
                                }
                              } else {
                                Helpers.showToast("Field is empty");
                              }
                            });
                      }),
                ],
              ),
              20.verticalSpace,
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ResetPassword(),
                )),
                child: Text(
                  "Forgot password ?",
                  style: FontPalette.black12500underline,
                ),
              )
            ],
          ).horizontalPadding(25.w).verticalPadding(20.h),
        ),
      ),
    );
  }
}
